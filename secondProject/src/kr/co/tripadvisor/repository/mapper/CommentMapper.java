package kr.co.tripadvisor.repository.mapper;

import kr.co.tripadvisor.repository.domain.BoardComment;

public interface CommentMapper {
	void insertComment(BoardComment comment);
	BoardComment selectCommentByNo(int no);
	void updateComment(BoardComment comment);
	void deleteComment(int no);
}
