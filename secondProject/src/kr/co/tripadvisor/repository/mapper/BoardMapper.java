package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.BoardImage;

public interface BoardMapper {
	List<Board> selectBoard();
//	List<Board> selectBoard(BoardSearch search);
	void insertBoard (Board board);
	void insertBoardImage(BoardImage file);
	void updateBoardViewCnt(int no);
	Board selectBoardByNo(int no);

}