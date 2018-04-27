package kr.co.tripadvisor.common.file;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tripadvisor.common.db.MyAppSqlConfig;
import kr.co.tripadvisor.repository.mapper.ImageMapper;

@WebServlet("/fileDelete")
public class FileDeleteController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(ImageMapper.class);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		// 파일이 저장되어 있는 기본 경로
		String defaultPath = "c:/java-lec/upload";
		
		// ajax를 통해 에디터에서 파일 삭제 시 넘어오는 결과값
		// 예) http://localhost:8000/secondProject/down?path=/2018/04/26/11&sName=c6362f6b-f115-428c-8fc6-c023b9283872.jpg
		String src = request.getParameter("src");
		
		// 세부 경로와 파일명을 가져오기
		// path=/2018/04/26/11&sName=c6362f6b-f115-428c-8fc6-c023b9283872.jpg
		String[] srcTmp = src.split("\\?");
		
		// 세부 경로와 파일명 분리
		// path=/2018/04/26/11
		// sName=c6362f6b-f115-428c-8fc6-c023b9283872.jpg
		String[] srcTmp2 = srcTmp[1].split("&");
		
		// 세부 경로를 뽑아내기 위해 =로 분류하고 변수에 저장
		// [0]번 인덱스 : path
		// [1]번 인덱스 : /2018/04/26/11
		srcTmp = srcTmp2[0].split("=");
		String datePath = srcTmp[1];
		
		// 파일명을 뽑아내기 위해 =로 분류하고 변수에 저장
		// [0]번 인덱스 : sName
		// [1]번 인덱스 : c6362f6b-f115-428c-8fc6-c023b9283872.jpg
		srcTmp = srcTmp2[1].split("=");
		String fileName = srcTmp[1];
		
		// 파일 삭제 처리 부분
		// 파일 객체 생성을 위해 기본 경로와 날짜 경로와 "/", 파일명을 묶어 하나의 변수에 저장
		// c:/java-lec/upload/2018/04/26/11/c6362f6b-f115-428c-8fc6-c023b9283872.jpg
		String fName = defaultPath + datePath + "/" + fileName;
		
		File file = new File(fName);
		
		if (file.exists()) {
			file.delete();
			out.print("파일 삭제 완료");
		} else {
			out.print("파일이 존재하지 않음");
		}
		
		// DB 테이블의 파일 정보 삭제 처리
		mapper.deleteFileInfo(fileName);
		
		out.close();
	}
}
