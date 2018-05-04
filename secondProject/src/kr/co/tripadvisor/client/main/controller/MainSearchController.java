package kr.co.tripadvisor.client.main.controller;

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
import kr.co.tripadvisor.repository.mapper.BoardMapper;

@WebServlet("/kr/co/tripadvisor/board/searchList")
public class MainSearchController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		request.setCharacterEncoding("utf-8");
		
		String searchWord = request.getParameter("searchWord");
		
		List<Board> list = mapper.searchList(searchWord);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/kr/co/tripadvisor/board/search.jsp");
		rd.forward(request, response);
	}


}
