package kr.co.tripadvisor.client.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Notice;
import kr.co.tripadvisor.repository.mapper.NoticeMapper;

@WebServlet("/kr/co/tripadvisor/notice/detail")
public class DetailNoticeController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NoticeMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		mapper.updateNoticeViewCnt(no);
		Notice notice = mapper.selectNoticeByNo(no);
		
		request.setAttribute("notice", notice);
		
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		rd.forward(request, response);
	
	}
}
