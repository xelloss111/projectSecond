package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Stastics {
	private Integer boardCount;
	private Integer galleryCount;
	private Integer noticeCount;
	private Integer userCount;
	private Integer commentCount;
	private Integer scrapCount;
	private Date stasticsDate;
	
	public Integer getBoardCount() {
	    return boardCount;
	}
	public void setBoardCount(Integer boardCount) {
	    this.boardCount = boardCount;
	}
	public Integer getGalleryCount() {
	    return galleryCount;
	}
	public void setGalleryCount(Integer galleryCount) {
	    this.galleryCount = galleryCount;
	}
	public Integer getNoticeCount() {
	    return noticeCount;
	}
	public void setNoticeCount(Integer noticeCount) {
	    this.noticeCount = noticeCount;
	}
	public Integer getUserCount() {
	    return userCount;
	}
	public void setUserCount(Integer userCount) {
	    this.userCount = userCount;
	}
	public Integer getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}
	public Integer getScrapCount() {
	    return scrapCount;
	}
	public void setScrapCount(Integer scrapCount) {
	    this.scrapCount = scrapCount;
	}
	public Date getStasticsDate() {
	    return stasticsDate;
	}
	public void setStasticsDate(Date stasticsDate) {
	    this.stasticsDate = stasticsDate;
	}
}
