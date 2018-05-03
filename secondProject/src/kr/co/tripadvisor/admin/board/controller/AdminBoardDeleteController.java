package kr.co.tripadvisor.admin.board.controller;

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
import kr.co.tripadvisor.repository.mapper.BoardMapper;

@WebServlet("/net/admin/board/free/deleteBoard")
public class AdminBoardDeleteController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// json 방식으로 응답
		BoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(BoardMapper.class);
		PrintWriter out = response.getWriter();

		// 체크박스를 통해 여러개 값을 선택해서 삭제하는 경우
		if(request.getParameter("board") != null) {
			response.setContentType("application/json; charset=utf-8"); 
			String data = request.getParameter("board");
			System.out.println(data.toString());
			try {
				JSONParser parser = new JSONParser();
				JSONObject jsonObj = (JSONObject)parser.parse(data);
				JSONArray boardArr = (JSONArray)jsonObj.get("board");
				for (int i = 0; i < boardArr.size(); i++) {
					JSONObject tempObj = (JSONObject)boardArr.get(i);
					int no = Integer.parseInt(tempObj.get("no").toString());
					System.out.println(no);
					// JSON 배열의 각각의 객체에서 뽑아낸 값으로 게시판 삭제 처리
					mapper.deleteBoardByNo(no);
				}
			} catch (ParseException e) {
			}
			out.print(new Gson().toJson(request.getContextPath() + "/net/admin/board/free/list"));
			out.close();
			return;
		} 
		// 테이블에 삭제 버튼을 통해 게시물 하나만 삭제하는 경우
		else {
			int no = Integer.parseInt(request.getParameter("no"));
			mapper.deleteBoard(no);
			response.sendRedirect(request.getContextPath() + "/net/admin/board/free/list");
		}
	}
}
