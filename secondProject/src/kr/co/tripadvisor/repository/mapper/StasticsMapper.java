package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Stastics;

public interface StasticsMapper {
	void insertStastics(Stastics stastics);
	List<Stastics> selectStastics(String date);
	int selectStasticsCheck(String date);
	int boardCount(String date);
	int galleryCount(String date);
	int noticeCount(String date);
	int scrapCount(String date);
	int boardCommentCount(String date);
	int galleryCommentCount(String date);
	int userCount(String date);	
}
