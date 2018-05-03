package kr.co.tripadvisor.client.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.NoticeImage;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;

@WebServlet("/kr/co/tripadvisor/board/delete")
public class DeleteBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		ImageMapper iMapper = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		
		int BoardNo =Integer.parseInt(request.getParameter("boardNo"));
		
		// 글번호에 해당하는 이미지 정보 가져오기
				String localPath = "c:/java-lec/upload";
						
				List<BoardImage> list = iMapper.selectFileInfoBoard(BoardNo);
				
				// 이미지 정보 리스트에서 각각의 파일에 대한 정보로 파일을 삭제하고
				// DB 정보도 함께 삭제
				for (BoardImage m : list) {
					String datePath = m.getPath();
					String sysName = m.getSysName();
					File delFile = new File(localPath + datePath + "/", sysName);
					if (delFile.exists()) delFile.delete();
					iMapper.deleteFileInfoBoard(sysName);
				}
				
		mapper.deleteBoard(BoardNo);
		
		response.sendRedirect("list");
	}
	
}
