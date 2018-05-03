package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;


@WebServlet("/user/update")
public class UpdateUserController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		
		User user = new User();
		
		user.setId(request.getParameter("id"));
		user.setEmail(request.getParameter("email"));
		user.setPass(request.getParameter("pass"));
		
		int result = mapper.updateUser(user);
		user = mapper.selectUserById(request.getParameter("id"));
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result != -1) {
			
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			out.println("<script>");
			out.println("alert(\"정보수정에 성공했습니다.\")");
			out.println("window.location = \"/secondProject/user/mypage\";");
			out.println("</script>");
			out.flush();
			return;
		} else {
			out.println("<script language='javascript'>");
			out.println("alert(\"정보수정에 실패했습니다.\")");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
		}
		
		
	}

}