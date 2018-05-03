package kr.co.tripadvisor.client.gallery.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Comment;
import kr.co.tripadvisor.repository.mapper.CommentMapper;

@WebServlet("/kr/co/tripadvisor/gallery/writeComment")
public class WriteGalleryCommentController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CommentMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);
		
		Comment comment = new Comment();
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		comment.setBoardNo(boardNo);
		comment.setId(request.getParameter("id"));
		comment.setContent(request.getParameter("content"));
		
		mapper.insertComment(comment);
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(new Gson().toJson(mapper.selectCommentByNo(boardNo)));
	}
	
}

