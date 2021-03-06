package kr.co.tripadvisor.admin.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.mapper.BoardMapper;

@WebServlet("/net/admin/board/free/updateBoard")
public class AdminBoardUpdateController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		Board board = new Board();
		
		board.setBoardNo(Integer.parseInt(request.getParameter("no")));
		board.setId(request.getParameter("id"));
		board.setTitle(request.getParameter("title"));
		board.setEditordata(request.getParameter("editordata"));
		board.setArea(request.getParameter("area"));
		board.setAttract(request.getParameter("attract"));
		
		mapper.updateBoard(board);
		
		response.sendRedirect(request.getContextPath() + "/net/admin/board/free/list");
	}
}
