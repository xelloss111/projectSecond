package kr.co.tripadvisor.client.gallery.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.mapper.BoardMapper;


@WebServlet("/gallery/updateForm")
public class UpdateFormGalleyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		Board board = mapper.selectBoardByNo(Integer.parseInt(request.getParameter("boardNo")));
		request.setAttribute("board", board);
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/kr/co/tripadvisor/gallery/updateform.jsp");
		rd.forward(request, response);

	}
	
}

