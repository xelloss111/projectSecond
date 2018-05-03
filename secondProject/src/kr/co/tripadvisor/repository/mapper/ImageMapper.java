package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.NoticeImage;

public interface ImageMapper {
	// 공지
	void insertFileInfo(NoticeImage nImage);
	void deleteFileInfo(String sysName);
	void updateFileInfo(NoticeImage nImage);
	List<NoticeImage> selectFileInfo(int no);
	
	//민희_board
	void updateFileInfoBoard(BoardImage bImage);
	void insertFileInfoBoard(BoardImage bImage);
	List<BoardImage> selectFileInfoBoard(int no);
	//board image 
	BoardImage selectimageboardList();
	
	
	//혜리_갤러리
	void insertImageFile(BoardImage image);
	List<BoardImage> selectImageAll();
	List<BoardImage> selectImageFile(int BoardNo);
	
	

}
