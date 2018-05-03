package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;


@WebServlet("/kr/co/tripadvisor/user/login")
public class LoginUserController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		User user = mapper.selectUserById(id);
		
		PrintWriter out = response.getWriter();
		if (user == null) {
			out.println("<script language='javascript'>");
			out.println("alert('아이디를 확인하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			return;
		}
		else if (user.getPass().equals(pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/kr/co/tripadvisor/index.jsp");
			return;
		}
		else {
			out.println("<script language='javascript' charset=\"utf-8\">");
			out.println("alert('비밀번호를 확인하세요.')");
			out.println("history.go(-1);");
			out.println("</script>");
			return;
		}
	}
}