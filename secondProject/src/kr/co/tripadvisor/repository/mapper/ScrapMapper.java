package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Scrap;

public interface ScrapMapper {
	void insertScrap(Scrap scrap);
	List<Scrap> selectScrapById(String id);
	Scrap selectScrapByNo(int no);
	void deleteScrap(int no);
}
