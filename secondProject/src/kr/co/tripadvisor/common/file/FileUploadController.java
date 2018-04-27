package kr.co.tripadvisor.common.file;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import kr.co.tripadvisor.repository.domain.NoticeImage;
import kr.co.tripadvisor.repository.mapper.ImageMapper;


@WebServlet("/fileUpload")
public class FileUploadController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		
		PrintWriter out = response.getWriter();
		
		String defaultPath = "c:/java-lec/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String detailPath = sdf.format(new Date());
		
		File f = new File(defaultPath + detailPath);
		if(!f.exists()) f.mkdirs();
		
		MultipartRequest mRequest = new MultipartRequest(
				request,
				defaultPath + detailPath,
				1024 * 1024 * 100,
				"utf-8",
				new FileUploadRenamePolicy()
		);
		
		Enumeration<String> names = mRequest.getFileNames();
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			File file = mRequest.getFile(name);
			if (file != null) {
				String oriName = mRequest.getOriginalFileName(name);
				String sysName = mRequest.getFilesystemName(name);
				long fileSize = file.length();
				
				NoticeImage nImage = new NoticeImage();
				nImage.setNo(1);
				nImage.setOriName(oriName);
				nImage.setSysName(sysName);
				nImage.setDefaultPath(defaultPath);
				nImage.setDetailPath(detailPath);
				nImage.setFileSize(fileSize);
				mapper.insertFileInfo(nImage);
				
				out.println(detailPath + "&sName=" + sysName);
				out.close();
			}
		}
	}
}
