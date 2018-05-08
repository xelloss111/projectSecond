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

		BoardMapper sMapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		//검색
		BoardSearch bs = new BoardSearch();
		
		String [] attrList = request.getParameterValues("attract");
		String [] areaList = request.getParameterValues("area");
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		bs.setAreaList(areaList);
		bs.setAttrList(attrList);
		bs.setSearchType(searchType);
		bs.setSearchWord(searchWord);
		
		//페이징
		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		String no = request.getParameter("pageNo");
		int pageNo = (no != null) ? Integer.parseInt(no) : 1; 
		
		int totalCnt = 0;
		if(areaList==null & attrList==null & searchType==null & searchWord==null) {
		totalCnt = mapper.totalBoardCount();
		Paging paging = new Paging(totalCnt, pageNo, 10, 5);
		request.setAttribute("paging", paging);
		List<Board> searchList = mapper.boardListUp(paging);
		request.setAttribute("searchList", searchList);
		
		} else {
			
		totalCnt = mapper.BoardCountByCategory(bs);
		Paging paging = new Paging(totalCnt, pageNo, 10, 5);
		request.setAttribute("paging", paging);
		List<Board> searchList = sMapper.boardSearchList(bs);
		request.setAttribute("searchList", searchList);
		}		

		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
	}
	
}