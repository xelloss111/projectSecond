package kr.co.tripadvisor.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.domain.NoticeImage;
import kr.co.tripadvisor.repository.mapper.ImageMapper;
import kr.co.tripadvisor.repository.mapper.NoticeMapper;

@WebServlet("/net/admin/notice/noticeDelete")
public class DeleteNoticeController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(NoticeMapper.class);
		ImageMapper iMapper = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 글번호에 해당하는 이미지 정보 가져오기
		String localPath = "c:/java-lec/upload";
				
		List<NoticeImage> list = iMapper.selectFileInfo(no);
		
		// 이미지 정보 리스트에서 각각의 파일에 대한 정보로 파일을 삭제하고
		// DB 정보도 함께 삭제
		for (NoticeImage m : list) {
			String datePath = m.getDetailPath();
			String sysName = m.getSysName();
			File delFile = new File(localPath + datePath + "/", sysName);
			if (delFile.exists()) delFile.delete();
			iMapper.deleteFileInfo(sysName);
		}
		
		// 공지 삭제
		mapper.deleteNotice(no);

		response.sendRedirect("list");
	}
}
