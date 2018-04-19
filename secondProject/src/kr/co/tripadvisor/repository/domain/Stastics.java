package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Stastics {
	private int boardCount;
	private int galleryCount;
	private int noticeCount;
	private int userCount;
	private int boardCommentCount;
	private int galleryCommentCount;
	private Date statDate;
	
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getGalleryCount() {
		return galleryCount;
	}
	public void setGalleryCount(int galleryCount) {
		this.galleryCount = galleryCount;
	}
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}
	public int getBoardCommentCount() {
		return boardCommentCount;
	}
	public void setBoardCommentCount(int boardCommentCount) {
		this.boardCommentCount = boardCommentCount;
	}
	public int getGalleryCommentCount() {
		return galleryCommentCount;
	}
	public void setGalleryCommentCount(int galleryCommentCount) {
		this.galleryCommentCount = galleryCommentCount;
	}
	public Date getStatDate() {
		return statDate;
	}
	public void setStatDate(Date statDate) {
		this.statDate = statDate;
	}
	public int getNoticeCount() {
		return noticeCount;
	}
	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}
}
