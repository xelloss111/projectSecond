package kr.co.tripadvisor.admin.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Admin;
import kr.co.tripadvisor.repository.mapper.AdminMapper;

@WebServlet("/net/admin/management/adminSubmit")
public class SubmitManagerController extends HttpServlet {

	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String noticeAuth = "f";
		String boardAuth = "f";
		String galleryAuth = "f";
		String userAuth = "f";
		
		String[] authList = request.getParameterValues("auth");
		
		for (String s : authList) {
			if ("1".equals(s)) noticeAuth = "t";
			if ("2".equals(s)) boardAuth = "t";
			if ("3".equals(s)) galleryAuth = "t";
			if ("4".equals(s)) userAuth = "t";
		}
		
		Admin admin = new Admin();
		admin.setId(id);
		admin.setPass(pass);
		admin.setName(name);
		admin.setNoticeAuth(noticeAuth);
		admin.setBoardAuth(boardAuth);
		admin.setGalleryAuth(galleryAuth);
		admin.setUserAuth(userAuth);
		mapper.insertAdmin(admin);
		
		response.sendRedirect(request.getContextPath() + "/net/admin/management/index");
	}
}
