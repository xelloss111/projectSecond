package kr.co.tripadvisor.client.gallery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.mapper.BoardMapper;


@WebServlet("/gallery/update")
public class UpdateGalleryController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		Board board = new Board();
		board.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		board.setTitle(request.getParameter("title"));
		board.setEditordata((request.getParameter("content")));
		mapper.updateBoard(board);
		
		response.sendRedirect("detail?boardNo="+board.getBoardNo());

	}
	
}