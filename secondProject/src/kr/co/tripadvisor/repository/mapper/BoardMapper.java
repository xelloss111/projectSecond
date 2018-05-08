package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.BoardImage;
import kr.co.tripadvisor.repository.domain.BoardSearch;

public interface BoardMapper {
	
	void insertBoardImage(BoardImage file);

	List<Board> selectBoard();
//	List<Board> selectBoard(BoardSearch search);
	void insertBoard (Board board);
	Board selectBoardByNo(int boardNo);
	int updateBoard(Board board);
	
	int deleteBoardByNo(int boardNo);
	
	//min
	
	void updateBoardViewCnt(int boardno);
	
	//민희
	//index list
	List<Board> selectIndex();	
	
	//index search
	 List<Board> searchList(String seacrch);
	 
	 // board search
	 List<Board> boardSearchList(BoardSearch searchWord);
	 
	 // gallery search
	 List<Board> gallerySearchList(BoardSearch searchWord);

	 //board Delete
	 void deleteBoard(int no);
	 
	 // 게시글 삭제 시 스크랩 DB 삭제
	 void deleteBoardandScrap(int no);
	 
	 

}