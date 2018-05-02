package kr.co.tripadvisor.admin.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Admin;
import kr.co.tripadvisor.repository.domain.Notice;
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.mapper.PagingMapper;

@WebServlet("/net/admin/notice/list")
public class ListNoticeController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		
		String no = request.getParameter("pageNo");
		int pageNo = (no != null) ? Integer.parseInt(no) : 1; 
		
		int totalCnt = mapper.totalNoticeCount();
		Paging paging = new Paging(totalCnt, pageNo, 10, 5);
		
		List<Notice> list = mapper.noticeListUp(paging);
		
		request.setAttribute("noticeList", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
	}
}
