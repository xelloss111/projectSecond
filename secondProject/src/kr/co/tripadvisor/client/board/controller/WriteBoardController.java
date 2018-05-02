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


@WebServlet("/kr/co/tripadvisor/board/writeboard") 

public class WriteBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		request.setCharacterEncoding("utf-8");
		
		String codeNo = request.getParameter("codeNo");
		String title = request.getParameter("title");
		String editordata = request.getParameter("editordata");
		String id = request.getParameter("id");
		String area = request.getParameter("area");
		String attract = request.getParameter("attract");
		
		Board b = new Board();
		
		b.setCodeNo(codeNo);
		b.setTitle(title);
		b.setEditordata(editordata);
		b.setId(id);
		b.setArea(area);
		b.setAttract(attract);
		mapper.insertBoard(b);
		
		response.sendRedirect(request.getContextPath() + "/kr/co/tripadvisor/board/list");
	}

}

