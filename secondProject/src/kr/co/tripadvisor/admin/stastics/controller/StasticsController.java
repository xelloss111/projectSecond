package kr.co.tripadvisor.admin.stastics.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Stastics;
import kr.co.tripadvisor.repository.mapper.StasticsMapper;

@WebServlet("/net/admin/stastics/search")
public class StasticsController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StasticsMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(StasticsMapper.class);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		List<Stastics> list = null;
		String date = request.getParameter("date");
		
		Date targetDate = null;
		
		if (date == null) {
			return;
		}

		try {
			// 파라미터로 불러온 날짜가 오늘 날짜보다 큰 경우
			// alert 출력을 위한 메시지를 포함해서 리턴
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			targetDate = sdf.parse(date);
			if (targetDate.getTime() > today.getTime()) {
				out.print("오늘 날짜 또는 이전 날짜를 선택해 주세요");
				out.close();
				return;
			}
		} catch (ParseException e) {
		}
		
//		System.out.println(date);
		
		int noticeCount = mapper.noticeCount(date);
		int userCount = mapper.userCount(date);
		int boardCount = mapper.boardCount(date);
		int galleryCount = mapper.galleryCount(date);
		int commentCount = mapper.commentCount(date);
//		int galleryCommentCount = mapper.galleryCommentCount(date);
		int scrapCount = mapper.scrapCount(date);
		
		Stastics stastics = new Stastics();
		stastics.setBoardCount(boardCount);
		stastics.setNoticeCount(noticeCount);
		stastics.setGalleryCount(galleryCount);
		stastics.setUserCount(userCount);
		stastics.setCommentCount(commentCount);
//			stastics.setGalleryCommentCount(galleryCommentCount);
		stastics.setScrapCount(scrapCount);
		stastics.setStasticsDate(targetDate);
		
		int check = mapper.selectStasticsCheck(date);
		System.out.println("날짜 체크 값 : " + check);
		
		
		if (mapper.selectStasticsCheck(date) == 0) {
			mapper.insertStastics(stastics);
		} else if (mapper.selectStasticsCheck(date) >= 1){
			mapper.updateStastics(stastics);
		}
		
		list = mapper.selectStastics(date);
		
		out.print(new Gson().toJson(list));
		out.close();
	}
}
