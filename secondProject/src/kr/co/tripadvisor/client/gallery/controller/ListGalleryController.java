package kr.co.tripadvisor.client.gallery.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.repository.domain.BoardSearch;
import kr.co.tripadvisor.repository.domain.Code;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.CodeMapper;

@WebServlet("/gallery/index")
public class ListGalleryController extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse arg1) throws ServletException, IOException {
		BoardSearch search = new BoardSearch();
		
		
		
		CodeMapper codeMapper = null;
		List<Code> attList = codeMapper.selectCodeList(1);
		List<Code> areaList = codeMapper.selectCodeList(2);
		
		request.setAttribute("attList", attList);
		request.setAttribute("areaList", areaList);
		
		BoardMapper boardMapper = null;
		
		boardMapper.selectBoard(search);
	}
	
}
