package kr.co.tripadvisor.client.board.controller;

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

@WebServlet("/kr/co/tripadvisor/board/detail")
public class DetailBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		CommentMapper cmtMapper = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);
		
		
		int no = Integer.parseInt(request.getParameter("boardNo"));
		
		mapper.updateBoardViewCnt(no);
		Board board = mapper.selectBoardByNo(no);

		
		request.setAttribute("board", board);
		
		
//		댓글
		
		List<Comment> commentList = cmtMapper.selectCommentByNo(no);
		request.setAttribute("commentList", commentList);
		
		try {
			request.setAttribute("commentNo", request.getParameter("commentNo"));
		} catch (NumberFormatException e) {
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		rd.forward(request, response);		
	}

}
