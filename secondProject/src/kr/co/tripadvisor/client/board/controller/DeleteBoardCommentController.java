package kr.co.tripadvisor.client.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.CommentMapper;

@WebServlet("/kr/co/tripadvisor/board/DeleteBoardComment")
public class DeleteBoardCommentController extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	
		mapper.deleteComment(commentNo);
		
		response.sendRedirect("detail?boardNo=" + boardNo);
	
	}
	
}
