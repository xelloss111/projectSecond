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
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;


@WebServlet("/kr/co/tripadvisor/gallery/updateform")
public class UpdateFormGalleyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		Board board = mapper.selectBoardByNo(boardNo);
		request.setAttribute("board", board);
		
		ImageMapper imgmap = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		List<BoardImage> imageList = imgmap.selectFileInfoBoard(boardNo);
		request.setAttribute("imageList", imageList);
		
		RequestDispatcher rd = request.getRequestDispatcher("updateform.jsp");
		rd.forward(request, response);

	}
	
}
