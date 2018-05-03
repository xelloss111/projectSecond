package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.Scrap;

public interface ScrapMapper {
	//	스크랩 추가
	void insertScrap(Scrap scrap);
	
	// 스크랩 list
	List<Scrap> selectScrapByNo(String id);
	
	// 스크랩 삭제
	void deleteScrap(int scrapNo);
}
