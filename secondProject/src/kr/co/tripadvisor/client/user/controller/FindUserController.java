package kr.co.tripadvisor.client.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.User;
import kr.co.tripadvisor.repository.mapper.UserMapper;

@WebServlet("/user/find")
public class FindUserController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		User user = new User();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		System.out.println("네임"+name);
		System.out.println("이메일"+email);
		System.out.println("아이디"+id);
		
		//아이디찾기
		if(id == null) {
			user.setName(name);
			user.setEmail(email);
			String findid = mapper.findId(user);
			System.out.println("겟아이디"+findid);

			response.setContentType("application/json; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.write("{\"id\": \"" + findid + "\"}");
			out.close();
		}
		
		//비밀번호찾기
		if(name == null) {
			user.setId(id);
			user.setEmail(email);
			String pass = mapper.findPass(user);
			System.out.println("겟패스"+pass);
			
			response.setContentType("application/json; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.write("{\"pass\": \"" + pass + "\"}");
			out.close();
			
		}
		
	}

	
	
}
