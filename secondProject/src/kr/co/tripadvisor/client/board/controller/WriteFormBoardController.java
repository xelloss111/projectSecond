package kr.co.tripadvisor.client.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tripadvisor.repository.domain.User;

@WebServlet("/kr/co/tripadvisor/board/writeform") 
public class WriteFormBoardController extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/kr/co/tripadvisor/board/writeform.jsp");
		rd.forward(request, response);
	}
}
