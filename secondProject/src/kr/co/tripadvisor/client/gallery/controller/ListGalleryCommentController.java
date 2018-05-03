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
import kr.co.tripadvisor.repository.mapper.CommentMapper;
@WebServlet("/kr/co/tripadvisor/gallery/commentList")
public class ListGalleryCommentController extends HttpServlet {
	@Override
	public void service(
		HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CommentMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(CommentMapper.class);
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(new Gson().toJson(mapper.selectCommentByNo(boardNo)));
	}
}
