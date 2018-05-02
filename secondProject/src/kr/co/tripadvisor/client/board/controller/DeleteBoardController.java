package kr.co.tripadvisor.client.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.BoardMapper;

@WebServlet("/kr/co/tripadvisor/board/delete")
public class DeleteBoardController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		mapper.deleteBoard(Integer.parseInt(request.getParameter("boardNo")));
		
		response.sendRedirect("list");
	}
	
}
