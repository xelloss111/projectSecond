package kr.co.tripadvisor.common.file;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.ImageMapper;

@WebServlet("/kr/co/tripadvisor/file/imagedel")
public class GalleryImageDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		int imageNo = Integer.parseInt(request.getParameter("imageNo"));
		System.out.println(imageNo);
		
		int delete = mapper.deleteGalleryImage(imageNo);
		System.out.println(delete);
		
		PrintWriter out = response.getWriter();
		
			response.setContentType("application/json; charset=utf-8"); 
			out.write("{\"result\": \"success\"}");
			out.close();
		
		
	}
	
	

}
