package kr.co.tripadvisor.client.gallery.controller;

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
import kr.co.tripadvisor.repository.domain.BoardSearch;
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;
import kr.co.tripadvisor.repository.mapper.PagingMapper;

@WebServlet("/kr/co/tripadvisor/gallery/index")
public class ListGalleryController extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//전체 이미지 리스트 불러오기
		ImageMapper imageMapper = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		List<BoardImage> imageList = imageMapper.selectImageAll();
		request.setAttribute("imageList", imageList);
		
		//검색영역
		BoardSearch search = new BoardSearch();
		
		String[] areaList = request.getParameterValues("area");
		String[] attrList = request.getParameterValues("attract");
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		search.setAreaList(areaList);
		search.setAttrList(attrList);
		search.setSearchType(searchType);
		search.setSearchWord(searchWord);
	
		//페이징
		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		String no = request.getParameter("pageNo");
		int pageNo = (no != null) ? Integer.parseInt(no) : 1; 
		
		int totalCnt = 0;
		if(areaList==null & attrList==null & searchType==null & searchWord==null) {
		totalCnt = mapper.totalGalleryCount();
		Paging paging = new Paging(totalCnt, pageNo, 9, 5);
		request.setAttribute("paging", paging);
		List<Board> boardList = mapper.galleryListUp(paging);
		request.setAttribute("boardList", boardList);
		} else {
		totalCnt = mapper.GalleryCountByCategory(search);
		Paging paging = new Paging(totalCnt, pageNo, 9, 5);
		request.setAttribute("paging", paging);
		BoardMapper boardMapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		List<Board> boardList = boardMapper.gallerySearchList(search);
		request.setAttribute("boardList", boardList);
		}
		

		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
		rd.forward(request, response);
	}
	
}
