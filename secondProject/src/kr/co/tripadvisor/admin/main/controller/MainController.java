package kr.co.tripadvisor.admin.main.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.admin.domain.Admin;
import kr.co.tripadvisor.admin.mapper.AdminMapper;
import kr.co.tripadvisor.common.db.MyAppSqlConfig;

@WebServlet("/net/admin/main/index")
public class MainController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		Admin admin = mapper.selectAdminInfo(id, pass);
		
		RequestDispatcher rd = null;
		
		if (id.equals(admin.getId()) && pass.equals(admin.getPass())) {
			rd = request.getRequestDispatcher("../stastics/index");
			rd.forward(request, response);
		} else {
			response.sendRedirect("index");
		}
	}
}
