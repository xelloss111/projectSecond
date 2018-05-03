package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;


@WebServlet("/kr/co/tripadvisor/user/singup")
public class SignUserController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		
		User user = new User();
		user.setName(request.getParameter("name"));
		user.setId(request.getParameter("id"));
		user.setPass(request.getParameter("pass"));
		user.setSex(request.getParameter("sex"));
		user.setEmail(request.getParameter("email"));
		user.setBirth(Integer.parseInt(request.getParameter("birth")));
		
		mapper.insertUser(user);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", mapper.selectUserById(request.getParameter("id")));
		
		response.sendRedirect(request.getContextPath() + "/kr/co/tripadvisor/index.jsp");
	}

}