package kr.co.tripadvisor.repository.mapper;

import kr.co.tripadvisor.repository.domain.NoticeImage;

public interface ImageMapper {
	void insertFileInfo(NoticeImage nImage);
	void deleteFileInfo(String sysName);
}
