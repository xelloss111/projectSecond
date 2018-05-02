package kr.co.tripadvisor.client.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Comment;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.CommentMapper;

@WebServlet("/kr/co/tripadvisor/board/WriteBoardComment")
public class WriteBoardCommentController extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CommentMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Comment comment = new Comment();
		comment.setBoardNo(boardNo);
		comment.setContent(request.getParameter("content"));
		comment.setId(request.getParameter("id"));
		
		mapper.insertComment(comment);
		
		response.sendRedirect("detail?boardNo=" + boardNo);
	}

	
}
