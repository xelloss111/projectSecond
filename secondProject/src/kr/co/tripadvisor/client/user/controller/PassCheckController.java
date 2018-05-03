package kr.co.tripadvisor.client.user.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.repository.domain.User;

@WebServlet("/user/passcheck")
public class PassCheckController extends HttpServlet {

  @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	  
	     //세션에서 패스워드 가져와서 넘겨주기
	      User user = (User) request.getSession().getAttribute("user");
	      String pass = user.getPass();
	      String infopass = request.getParameter("infopass");
	      String result = null;
	      
	      if(pass.equals(infopass)) {
	    	  result="true";
	      }else {
	    	  result="false";
	      }
	      
		  //ajax
		  response.setContentType("application/json; charset=utf-8"); 
		  PrintWriter out = response.getWriter();
		  out.write("{\"result\": \"" + result + "\"}");
		  out.close();
		  
  }
	}
  
