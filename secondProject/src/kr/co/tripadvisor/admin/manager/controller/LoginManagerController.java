package kr.co.tripadvisor.admin.manager.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Admin;
import kr.co.tripadvisor.repository.mapper.AdminMapper;

@WebServlet("/net/admin/main/login")
public class LoginManagerController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/net/admin/main");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		Admin admin = new Admin();
		admin = mapper.selectAdminInfo(id);
		
		if (admin == null) {
			request.setAttribute("errMsg", "아이디가 잘못되었습니다.");
		} else if (admin.getPass().equals(pass)) {
			HttpSession session = request.getSession();
			admin.setAccessTime(new Date());
			session.setAttribute("admin", admin);
			response.sendRedirect(request.getContextPath() +"/net/admin/stastics/index");
			return;
		} else {
			request.setAttribute("errMsg", "비밀번호가 잘못되었습니다.");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
}
