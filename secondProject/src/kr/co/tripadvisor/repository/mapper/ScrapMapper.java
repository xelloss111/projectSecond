package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.Scrap;

public interface ScrapMapper {
//	스크랩 추가
	void insertScrap(Scrap scrap);
	
	List<Board> selectScrapBoard();
	
	int selectBoardCheck(int boardNo);
	List<Scrap> selectScrapById(String id);
	Scrap selectScrapByNo(int no);
	void deleteScrap(int no);
}
