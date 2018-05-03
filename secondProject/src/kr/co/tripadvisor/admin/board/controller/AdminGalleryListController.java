package kr.co.tripadvisor.admin.board.controller;

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
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.mapper.PagingMapper;

@WebServlet("/net/admin/board/gallery/list")
public class AdminGalleryListController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PagingMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(PagingMapper.class);
		
		String no = request.getParameter("pageNo");
		int pageNo = (no != null) ? Integer.parseInt(no) : 1; 
		
		int totalCnt = mapper.totalGalleryCount();
		Paging paging = new Paging(totalCnt, pageNo, 10, 5);
		
		List<Board> list = mapper.galleryListUp(paging);
		
		request.setAttribute("galleryList", list);
		request.setAttribute("paging", paging);
		
		RequestDispatcher rd = request.getRequestDispatcher("/net/admin/modify/gallery/list.jsp");
		rd.forward(request, response);
	}
}
