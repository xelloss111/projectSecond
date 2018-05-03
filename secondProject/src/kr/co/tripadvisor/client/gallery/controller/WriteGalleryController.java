package kr.co.tripadvisor.client.gallery.controller;

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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.common.file.GalleryThumbnailUtil;
import kr.co.tripadvisor.common.file.MlecFileRenamePolicy;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.BoardMapper;
import kr.co.tripadvisor.repository.mapper.ImageMapper;

@WebServlet("/kr/co/tripadvisor/gallery/write")
public class WriteGalleryController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		Board board = new Board();
		
		
		//파일
		
		String uploadPath = "c:/java-lec/workspace/mini2_web1/secondProject/WebContent/galleryImg";
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
		
		
		
		board.setCodeNo(mRequest.getParameter("codeNo"));
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		board.setId(user.getId());
		board.setTitle(mRequest.getParameter("title"));
		board.setEditordata(mRequest.getParameter("editordata"));
		board.setArea(mRequest.getParameter("area"));
		board.setAttract(mRequest.getParameter("attract"));
		
		mapper.insertBoard(board);
		
		
		// 파일 저장..
				Enumeration<String> names = mRequest.getFileNames();
				while (names.hasMoreElements()) {
					String name = names.nextElement();
					File f = mRequest.getFile(name);
					if (f != null) {
						String oriName = mRequest.getOriginalFileName(name);
						String systemName = mRequest.getFilesystemName(name);
						long fileSize = f.length();
						
						GalleryThumbnailUtil thumb = new GalleryThumbnailUtil();
						thumb.createThumbnail(datePath, systemName);
						
					ImageMapper map = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
						// 데이터베이스에 파일 정보 저장
						BoardImage bi = new BoardImage();
						
						bi.setBoardNo(board.getBoardNo());
						bi.setFileSize(fileSize);
						bi.setOriName(oriName);
						bi.setSysName(systemName);
						bi.setPath(datePath);
						map.insertImageFile(bi);
						
					
					}
				}
		
//		response.sendRedirect("detail?boardNo="+board.getBoardNo());
		response.sendRedirect("index");

	}
	
}
