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
import kr.co.tripadvisor.repository.domain.Code;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.CodeMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;

@WebServlet("/gallery/index")
public class ListGalleryController extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		BoardSearch search = new BoardSearch();
		
		CodeMapper codeMapper = MyAppSqlConfig.getSqlSession().getMapper(CodeMapper.class);
		List<Code> attList = codeMapper.selectCodeList(1);
		List<Code> areaList = codeMapper.selectCodeList(2);
		request.setAttribute("attList", attList);
		request.setAttribute("areaList", areaList);
		
		ImageMapper imageMapper = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		List<BoardImage> imageList = imageMapper.selectImageAll();
		request.setAttribute("imageList", imageList);
		
		BoardMapper boardMapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
//		List<Board> boardList = boardMapper.selectBoard(search);
		List<Board> boardList = boardMapper.selectBoardByCode("3002");
		request.setAttribute("boardList", boardList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/kr/co/tripadvisor/gallery/list.jsp");
		rd.forward(request, response);
	}
	
}
