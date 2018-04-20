package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.BoardSearch;

public interface BoardMapper {
	List<Board> selectBoard(BoardSearch search);
	void insertBoard (Board board);
}
