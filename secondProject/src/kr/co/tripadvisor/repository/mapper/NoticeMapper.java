package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Notice;

public interface NoticeMapper {
	void insertNotice(Notice notice);
	List<Notice> selectNotice();
	Notice selectNoticeByNo(int no);
	void updateNotice(Notice notice);
	void deleteNotice(int no);	
}
