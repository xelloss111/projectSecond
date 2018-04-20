package kr.co.tripadvisor.admin.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Admin;
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.mapper.PagingMapper;

@WebServlet("/net/admin/management/index")
public class ListManagerController extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		AdminMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		
		int pageNo;
		
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} else {
			pageNo = 1;
		}
		
		int totalCnt = mapper.totalAdminCount();
		Paging paging = new Paging(totalCnt, pageNo);
		
		System.out.println(paging.getStartCount());
		System.out.println(paging.getEndCount());
		System.out.println(paging.getStartPage());
		System.out.println(paging.getEndPage());
		
		List<Admin> list = mapper.adminAccountListUp(paging);

		request.setAttribute("adminList", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
}
