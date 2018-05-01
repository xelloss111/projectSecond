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

@WebServlet("/gallery/updateComment")
public class UpdateGalleryCommentController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		CommentMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);

		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		Comment comment = new Comment();
		comment.setContent(request.getParameter("content"));
		comment.setCommentNo(commentNo);
		
		// 게시물 저장 처리 부탁..
		mapper.updateComment(comment);
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(new Gson().toJson(mapper.selectCommentByNo(boardNo)));
	}
	
}
