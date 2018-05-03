package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;

@WebServlet("/kr/co/tripadvisor/user/naversign")
public class NaverSign extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		
		User user = new User();
		String id = request.getParameter("id");
		int result = mapper.selectIdCount(id);
		
		if(result!=0) {
			HttpSession session = request.getSession();
			session.setAttribute("user", mapper.selectUserById(id));
			response.sendRedirect(request.getContextPath() + "/kr/co/tripadvisor/main");
			return;
		}
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		
		System.out.println(email);
		System.out.println(name);
		System.out.println(id);
		System.out.println(sex);
		
		user.setEmail(email);
		user.setName(name);
		user.setId(id);
		user.setSex(sex);
		
		request.setAttribute("user", user);
		
		RequestDispatcher rd = request.getRequestDispatcher("naversign.jsp");
		rd.forward(request, response);
		
	}
	
	

}
