package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;

@WebServlet("/user/delete")
public class DeleteUserController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		
		User user = (User) request.getSession().getAttribute("user");
	    String id = user.getId();
		
		int result = mapper.deleteUser(id);
		
		PrintWriter out = response.getWriter();
		if(result != -1) {
			request.getSession().invalidate();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
			out.println("<script language='javascript' charset=\"utf-8\">");
			out.println("alert(\"정상적으로 탈퇴되었습니다.\")");
			out.println("window.location = \"/secondProject/kr/co/tripadvisor/index.jsp\"");
			out.println("</script>");
			out.flush();
			return;
			
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
			out.println("<script language='javascript' charset=\"utf-8\">");
			out.println("alert(\"탈퇴에 실패했습니다.\")");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
		}
	}

}
