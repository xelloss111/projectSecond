package kr.co.tripadvisor.client.board.controller;

import java.io.IOException;
import java.util.Enumeration;
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
import kr.co.tripadvisor.repository.domain.BoardSearch;
import kr.co.tripadvisor.repository.domain.Notice;
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;
import kr.co.tripadvisor.repository.mapper.PagingMapper;

@WebServlet("/kr/co/tripadvisor/board/list")
public class ListBoardController extends HttpServlet{

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		BoardMapper sMapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		String no = request.getParameter("pageNo");
		
		BoardSearch bs = new BoardSearch();
		
		String [] attrList = request.getParameterValues("attract");
		String [] areaList = request.getParameterValues("area");
		
		bs.setAttrList(attrList);
		bs.setAreaList(areaList);
		
		bs.setSearchType(request.getParameter("searchType"));
		bs.setSearchWord(request.getParameter("searchWord"));
		
		try {
			System.out.println("몇 개?: "+ attrList.length);
			for (String s : attrList) {
				System.out.println(s);
			}
		} catch (Exception e) {
			
		}
		
		
		int pageNo = (no != null) ? Integer.parseInt(no) : 1; 
		
		int totalCnt = mapper.totalBoardCount();
		Paging paging = new Paging(totalCnt, pageNo, 10, 5);
		
//		List<Board> list = mapper.boardListUp(paging);
		
		List<Board> searchList = sMapper.boardSearchList(bs);
					
		request.setAttribute("searchList", searchList);
		request.setAttribute("paging", paging);

		System.out.println("검색 결과 : " + searchList);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
	}
	
}