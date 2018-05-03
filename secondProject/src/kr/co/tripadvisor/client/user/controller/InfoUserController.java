package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;

@WebServlet("/user/info")
public class InfoUserController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		//네이버 로그인 유저는 접근 불가능
		User user = (User) request.getSession().getAttribute("user");
	    if (user.getPass().equals(" ")) {
	    	PrintWriter out = response.getWriter();
	    	response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
			out.println("<script language='javascript' charset=\"utf-8\">");
			out.println("alert(\"네이버로그인 사용자는 이용할 수 없습니다.\")");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
			return;
	    }
		
		//info.jsp로 연결시켜준다.
		RequestDispatcher rd = request.getRequestDispatcher("/kr/co/tripadvisor/member/info.jsp");
		rd.forward(request, response);
		
	}

}
