package kr.co.tripadvisor.admin.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.PagingMapper;

@WebServlet("/net/admin/management/user")
public class StatusUserController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		
		int pageNo;
		
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} else {
			pageNo = 1;
		}
		
		int totalCnt = mapper.totalUserCount();
		Paging paging = new Paging(totalCnt, pageNo, 10, 5);
		
		System.out.println(paging.getStartCount());
		System.out.println(paging.getEndCount());
		System.out.println(paging.getStartPage());
		System.out.println(paging.getEndPage());
		
		List<User> list = mapper.userListUp(paging);

		request.setAttribute("userList", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
		rd.forward(request, response);
	}
}
