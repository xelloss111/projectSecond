package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Admin {
	private int no;
	private String id;
	private String pass;
	private String name;
	private String boardAuth;
	private String noticeAuth;
	private String userAuth;
	private Date accessTime;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBoardAuth() {
		return boardAuth;
	}
	public void setBoardAuth(String boardAuth) {
		this.boardAuth = boardAuth;
	}
	public String getNoticeAuth() {
		return noticeAuth;
	}
	public void setNoticeAuth(String noticeAuth) {
		this.noticeAuth = noticeAuth;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	public Date getAccessTime() {
		return accessTime;
	}
	public void setAccessTime(Date accessTime) {
		this.accessTime = accessTime;
	}
}
