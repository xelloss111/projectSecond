package kr.co.tripadvisor.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.NoticeMapper;

@WebServlet("/net/admin/notice/noticeDelete")
public class DeleteNoticeController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NoticeMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		mapper.deleteNotice(no);
		
		response.sendRedirect("list");
	}
}
