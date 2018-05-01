package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Comment;

public interface CommentMapper {
	
	//혜리_갤러리
	void insertComment(Comment comment);
	List<Comment> selectCommentByNo(int no);
	void updateComment(Comment comment);
	void deleteComment(int no);
}
