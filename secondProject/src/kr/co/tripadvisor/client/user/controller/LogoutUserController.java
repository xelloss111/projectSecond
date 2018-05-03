package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.UserMapper;

@WebServlet("/kr/co/tripadvisor/user/logout")
public class LogoutUserController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		request.getSession().invalidate();
		
		response.sendRedirect(request.getContextPath() + "/kr/co/tripadvisor/index.jsp");
		
	}

}
