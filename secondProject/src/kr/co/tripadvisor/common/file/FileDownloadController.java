package kr.co.tripadvisor.common.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/down")
public class FileDownloadController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = "c:/java-lec/upload";
		String path = request.getParameter("path");
		String sName = request.getParameter("sName");
		String dName = request.getParameter("dName");
		
		File f = new File(uploadPath + path, sName);
		
		if (dName == null) {
			response.setHeader("Content-Type", "image/jpg");
		} else {
			response.setHeader("Content-Type", "application/octet-stream");
			dName = new String(dName.getBytes("utf-8"), "8859_1");
			response.setHeader("Content-Disposition", "attachment;filename=" + dName);
		}
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while(true) {
			int ch = bis.read();
			if (ch == -1) break;
			bos.write(ch);
		}
		
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}
}
