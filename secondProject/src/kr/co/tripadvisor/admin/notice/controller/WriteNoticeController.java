package kr.co.tripadvisor.admin.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.Notice;
import kr.co.tripadvisor.repository.domain.NoticeImage;
import kr.co.tripadvisor.repository.mapper.ImageMapper;
import kr.co.tripadvisor.repository.mapper.NoticeMapper;

@WebServlet("/net/admin/notice/write")
public class WriteNoticeController extends HttpServlet {
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NoticeMapper.class);
		ImageMapper mapper2 = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		
		request.setCharacterEncoding("utf-8");
		
		String[] id = request.getParameterValues("id");
		String[] codeNo = request.getParameterValues("codeNo");
		String[] title = request.getParameterValues("title");
		String[] content = request.getParameterValues("editordata");
		String[] files = request.getParameterValues("file");

		// 에디터에 있는 게시글 등록
		Notice notice = new Notice();
		notice.setCodeNo(codeNo[0]);
		notice.setId(id[0]);
		notice.setTitle(title[0]);
		notice.setContent(content[0]);
		mapper.insertNotice(notice);
		
		// 파일명이 들어있는 배열에서 파일명을 읽고 현재 등록된 게시물 번호를 같이 포함하여 객체 생성 후 업데이트
		for (int i = 0; i < files.length; i++) {
			NoticeImage nImage = new NoticeImage();
			String fileName = (files[i].replaceAll("(\r\n|\r|\n|\n\r)", ""));
			System.out.println(fileName);
			nImage.setSysName(fileName);
			nImage.setNo(notice.getNo());
			mapper2.updateFileInfo(nImage);
		}
		
		PrintWriter out = response.getWriter();
		out.print(request.getContextPath() + "/net/admin/notice/list");
		out.close();
	}
}
