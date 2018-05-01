package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Comment {
	
	  private Integer commentNo;

	    private Integer boardNo;

	    private String id;

	    private String content;

	    private Date regDate;

	    public Integer getCommentNo() {
	        return commentNo;
	    }

	    public void setCommentNo(Integer commentNo) {
	        this.commentNo = commentNo;
	    }

	    public Integer getBoardNo() {
	        return boardNo;
	    }

	    public void setBoardNo(Integer boardNo) {
	        this.boardNo = boardNo;
	    }

	    public String getId() {
	        return id;
	    }

	    public void setId(String id) {
	        this.id = id;
	    }

	    public String getContent() {
	        return content;
	    }

	    public void setContent(String content) {
	        this.content = content;
	    }

	    public Date getRegDate() {
	        return regDate;
	    }

	    public void setRegDate(Date regDate) {
	        this.regDate = regDate;
	    }

}
