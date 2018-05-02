package kr.co.tripadvisor.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Notice;
import kr.co.tripadvisor.repository.mapper.NoticeMapper;

@WebServlet("/net/admin/notice/noticeUpdate")
public class UpdateNoticeController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NoticeMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		Notice notice = new Notice();
		notice.setNo(no);
		notice.setContent(request.getParameter("editordata"));
		notice.setTitle(request.getParameter("title"));
		
		mapper.updateNotice(notice);
		
		response.sendRedirect("list");
	}
}
