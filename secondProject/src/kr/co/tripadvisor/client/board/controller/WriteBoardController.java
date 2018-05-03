package kr.co.tripadvisor.client.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.NoticeImage;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;

@WebServlet("/kr/co/tripadvisor/board/write") 
public class WriteBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		ImageMapper mapper2 = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		
		request.setCharacterEncoding("utf-8");
		
		String[] id = request.getParameterValues("id");
		String[] codeNo = request.getParameterValues("codeNo");
		String[] title = request.getParameterValues("title");
		String[] editordata = request.getParameterValues("editordata");
		String[] files = request.getParameterValues("file");
		String[] area = request.getParameterValues("area");
		String[] attract = request.getParameterValues("attract");
		
		// 에디터에 있는 게시글 등록

		Board b = new Board();
		
		b.setCodeNo(codeNo[0]);
		b.setId(id[0]);
		b.setTitle(title[0]);
		b.setEditordata(editordata[0]);
		b.setArea(area[0]);
		b.setAttract(attract[0]);
		
		mapper.insertBoard(b);
		
		// 파일명이 들어있는 배열에서 파일명을 읽고 현재 등록된 게시물 번호를 같이 포함하여 객체 생성 후 업데이트
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				BoardImage bImage = new BoardImage();
				String fileName = (files[i].replaceAll("(\r\n|\r|\n|\n\r)", ""));
				bImage.setSysName(fileName);
				bImage.setBoardNo(b.getBoardNo());
				mapper2.updateFileInfoBoard(bImage);
			}
		}
		
		PrintWriter out = response.getWriter();
		out.print(request.getContextPath() + "/kr/co/tripadvisor/board/list");
		out.close();
	}

}

