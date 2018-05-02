package kr.co.tripadvisor.admin.manager.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Admin;
import kr.co.tripadvisor.repository.mapper.AdminMapper;

@WebServlet("/net/admin/management/updateManager")
public class UpdateManagerController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// json 방식으로 응답
		response.setContentType("application/json; charset=utf-8"); 
		
		AdminMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(AdminMapper.class);
		PrintWriter out = response.getWriter();
		
		String data = request.getParameter("admin");
		
		System.out.println(data.toString());
	
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject)parser.parse(data);
			JSONArray adminArr = (JSONArray)jsonObj.get("admin");
			for (int i = 0; i < adminArr.size(); i++) {
				JSONObject tempObj = (JSONObject)adminArr.get(i);
				System.out.println("no : " + tempObj.get("no"));
				System.out.println("id : " + tempObj.get("id"));
				System.out.println("이름 : " + tempObj.get("name"));
				System.out.println("boardAuth : " + tempObj.get("boardAuth"));
				System.out.println("noticeAuth : " + tempObj.get("noticeAuth"));
				System.out.println("galleryAuth : " + tempObj.get("galleryAuth"));
				System.out.println("userAuth : " + tempObj.get("userAuth"));
				
				// JSON 배열의 각각의 객체에서 뽑아낸 값을 Admin 객체 타입 변수에 set
				Admin admin = new Admin();
				admin.setNo(Integer.parseInt((String)tempObj.get("no")));
				admin.setBoardAuth((boolean)tempObj.get("boardAuth") == true ? "t" : "f" );
				admin.setNoticeAuth((boolean)tempObj.get("noticeAuth") == true ? "t" : "f");
				admin.setGalleryAuth((boolean)tempObj.get("galleryAuth") == true ? "t" : "f");
				admin.setUserAuth((boolean)tempObj.get("userAuth") == true ? "t" : "f");
				
				// Admin 객체 정보를 DB update
				mapper.updateAdmin(admin);
			}
		} catch (ParseException e) {
		}
		out.print(new Gson().toJson(request.getContextPath() + "/net/admin/management/index"));
		out.close();
	}
}
