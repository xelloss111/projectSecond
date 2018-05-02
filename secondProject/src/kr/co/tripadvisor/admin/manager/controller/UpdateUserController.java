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
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;

@WebServlet("/net/admin/management/updateUser")
public class UpdateUserController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8"); 
		
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		PrintWriter out = response.getWriter();
		
		String data = request.getParameter("user");
		
		System.out.println(data.toString());
	
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject)parser.parse(data);
			JSONArray userArr = (JSONArray)jsonObj.get("user");
			for (int i = 0; i < userArr.size(); i++) {
				JSONObject tempObj = (JSONObject)userArr.get(i);
				System.out.println("id : " + tempObj.get("id"));
				System.out.println("boardAuth : " + tempObj.get("boardAuth"));
				
				// JSON 배열의 각각의 객체에서 뽑아낸 값을 User 객체 타입 변수에 set
				User user = new User();
				user.setId((String)tempObj.get("id"));
				user.setBoardAuth((boolean)tempObj.get("boardAuth") == true ? "t" : "f");
				
				// User 객체 정보를 DB update
				mapper.adminUpdateUser(user);
			}
		} catch (ParseException e) {
		}
		out.print(new Gson().toJson(request.getContextPath() + "/net/admin/management/user"));
		out.close();
	
	}
}
