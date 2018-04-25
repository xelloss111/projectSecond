package kr.co.tripadvisor.client.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.common.file.MlecFileRenamePolicy;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.mapper.BoardMapper;


@WebServlet("/kr/co/tripadvisor/board/writeboard") 

public class WriteBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		
		String uploadPath = "D:\\summernote";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		File file = new File(uploadPath + datePath);
		if (!file.exists()) file.mkdirs();
		
		MultipartRequest mRequest = new MultipartRequest(
				request,
				uploadPath + datePath,
				1024 * 1024 * 100,
				"utf-8",
				new MlecFileRenamePolicy() 
				);
		
		Board b = new Board();
		b.setTitle(mRequest.getParameter("title"));
		b.setId(mRequest.getParameter("id"));
		b.setArea(mRequest.getParameter("area"));
		b.setAttract(mRequest.getParameter("attract"));
		b.setEditordata(mRequest.getParameter("editordata"));
		b.setCodeNo(mRequest.getParameter("codeNo"));
		mapper.insertBoard(b);
		
		
		
		Enumeration<String> names = mRequest.getFileNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			File f = mRequest.getFile(name);
			if (f != null) {
				String oriName = mRequest.getOriginalFileName(name);
				String systemName = mRequest.getFilesystemName(name);
				long fileSize = f.length();
				
				// 데이터베이스에 파일 정보 저장
				BoardImage bi = new BoardImage();
				bi.setBoardNo(b.getBoardNo());
				bi.setPath(datePath);
				bi.setOriName(oriName);
				bi.setSysName(systemName);
				bi.setFileSize(fileSize);
				mapper.insertBoardImage(bi);
			}
		}
		response.sendRedirect("list");
	}

	
}

