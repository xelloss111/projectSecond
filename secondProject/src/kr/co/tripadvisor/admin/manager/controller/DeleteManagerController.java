package kr.co.tripadvisor.admin.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.AdminMapper;

@WebServlet("/net/admin/management/adminDelete")
public class DeleteManagerController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
		
		mapper.deleteAdmin(request.getParameter("id"));
		
		response.sendRedirect(request.getContextPath() + "/net/admin/management/index");
	
	}
}
