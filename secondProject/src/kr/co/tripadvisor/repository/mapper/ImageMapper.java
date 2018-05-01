package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.NoticeImage;

public interface ImageMapper {
	void insertFileInfo(NoticeImage nImage);
	void deleteFileInfo(String sysName);
	
	//혜리_갤러리
	void insertImageFile(BoardImage image);
	List<BoardImage> selectImageAll();
	List<BoardImage> selectImageFile(int BoardNo);

}
