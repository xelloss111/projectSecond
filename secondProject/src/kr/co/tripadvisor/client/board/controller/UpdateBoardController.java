package kr.co.tripadvisor.client.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.mapper.BoardMapper;

@WebServlet("/kr/co/tripadvisor/board/UpdateBoard")
public class UpdateBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		request.setCharacterEncoding("utf-8");

		Board board = new Board();

		board.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		board.setTitle(request.getParameter("title"));
		board.setArea(request.getParameter("area"));
		board.setAttract(request.getParameter("attract"));
		board.setEditordata(request.getParameter("editordata"));
		
		mapper.updateBoard(board);

		response.sendRedirect("list");
	}
}
