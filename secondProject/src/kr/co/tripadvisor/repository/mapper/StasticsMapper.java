package kr.co.tripadvisor.repository.mapper;

import kr.co.tripadvisor.repository.domain.Stastics;

public interface StasticsMapper {
	void insertStastics(Stastics stastics);
	Stastics selectStastics(String date);
	int boardCount(String date);
	int galleryCount(String date);
	int noticeCount(String date);
	int scrapCount(String date);
	int boardCommentCount(String date);
	int galleryCommentCount(String date);
	int userCount(String date);	
}
