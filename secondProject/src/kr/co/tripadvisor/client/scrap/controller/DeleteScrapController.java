package kr.co.tripadvisor.client.scrap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.ScrapMapper;

@WebServlet("/kr/co/tripadvisor/user/scrap/deleteScrap")
public class DeleteScrapController extends HttpServlet {

	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	ScrapMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ScrapMapper.class);
	
	int scrapNo = Integer.parseInt(request.getParameter("ScrapNo"));
	
	mapper.deleteScrap(scrapNo);
	
	response.sendRedirect("/secondProject/kr/co/tripadvisor/user/scrap/scrapList");
		
	}

}
