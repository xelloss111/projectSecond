package kr.co.tripadvisor.client.board.controller;

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
import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.Notice;
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;
import kr.co.tripadvisor.repository.mapper.PagingMapper;

@WebServlet("/kr/co/tripadvisor/board/list")
public class ListBoardController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
//		
//		List<Board> list = mapper.selectBoard();
//		request.setAttribute("list", list);
		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		
		String no = request.getParameter("pageNo");
		int pageNo = (no != null) ? Integer.parseInt(no) : 1; 
		
		int totalCnt = mapper.totalBoardCount();
		Paging paging = new Paging(totalCnt, pageNo, 10, 5);
		
		List<Board> list = mapper.boardListUp(paging);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
	}
	
}