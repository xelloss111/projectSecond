package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.UserMapper;

@WebServlet("/signajax")
public class SignAjaxController extends HttpServlet  {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
	 
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String passcheck = request.getParameter("passcheck");
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		System.out.println(id);
		System.out.println(pass);
		System.out.println(passcheck);
		System.out.println(email);
		
		
		if(id != null) {
			int idcount = mapper.selectIdCount(id);
			response.setContentType("application/json; charset=utf-8"); 
			out.write("{\"idresult\": \"" + idcount + "\"}");
		}
		
		if(passcheck != null) {
			if(passcheck.equals(pass)) {
				response.setContentType("application/json; charset=utf-8"); 
				out.write("{\"passresult\": \"true\"}");
			} else {
				response.setContentType("application/json; charset=utf-8"); 
				out.write("{\"passresult\": \"false\"}");
			}
		}
		
		if(email != null) {
			int emailcount = mapper.selectEmailCount(email);
			System.out.println(emailcount);
			response.setContentType("application/json; charset=utf-8"); 
			out.write("{\"emailresult\": \"" + emailcount + "\"}");
		}
		
		out.close();
		
	}
}
