package kr.co.tripadvisor.client.scrap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.mapper.ScrapMapper;

@WebServlet("/kr/co/tripadvisor/member/scrap/scrapList")

public class ListScrapController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScrapMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ScrapMapper.class);
		
//		List<Board> list = mapper.selectScrapBoard(request.getParameter("id"));
		
//		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
	}

}
