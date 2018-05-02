package kr.co.tripadvisor.admin.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.Comment;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.CommentMapper;

@WebServlet("/net/admin/board/free/detail")
public class AdminBoardDetailController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		CommentMapper cmtMapper = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		mapper.updateBoardViewCnt(no);
		Board board = mapper.selectBoardByNo(no);
		request.setAttribute("board", board);
		
		List<Comment> commentList = cmtMapper.selectCommentByNo(no);
		request.setAttribute("commentList", commentList);
		
		try {
			request.setAttribute("commentNo", request.getParameter("commentNo"));
		} catch (NumberFormatException e) {
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/net/admin/modify/board/detail.jsp");
		rd.forward(request, response);	
	}
}
