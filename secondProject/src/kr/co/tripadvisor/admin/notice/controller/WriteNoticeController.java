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

@WebServlet("/net/admin/notice/write")
public class WriteNoticeController extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NoticeMapper.class);
		
		request.setCharacterEncoding("utf-8");
		
		String codeNo = request.getParameter("codeNo");
		String title = request.getParameter("title");
		String content = request.getParameter("editordata");
		String id = request.getParameter("id");
		
		Notice notice = new Notice();
		
		notice.setCodeNo(codeNo);
		notice.setId(id);
		notice.setTitle(title);
		notice.setContent(content);
		mapper.insertNotice(notice);
		
		response.sendRedirect(request.getContextPath() + "/net/admin/notice/list");
	}
}
