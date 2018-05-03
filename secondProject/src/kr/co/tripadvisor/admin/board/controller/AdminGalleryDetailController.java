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
import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.Comment;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.CommentMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;

@WebServlet("/net/admin/board/gallery/detail")
public class AdminGalleryDetailController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board board = mapper.selectBoardByNo(boardNo);
		request.setAttribute("board", board);
		
		ImageMapper imgmap = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		List<BoardImage> imgList = imgmap.selectImageFile(boardNo);
		request.setAttribute("imgList", imgList);
		
		CommentMapper comap = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);
		List<Comment> coList = comap.selectCommentByNo(boardNo);
		request.setAttribute("coList", coList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/net/admin/modify/gallery/detail.jsp");
		rd.forward(request, response);
	}
}
