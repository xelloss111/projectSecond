package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Notice {
	private String codeNo;
    private int no;
    private String title;
    private String id;
    private String content;
    private Date regDate;
    private Date modDate;
    private int viewCnt;
    NoticeImage noticeImage;
    
	public NoticeImage getNoticeImage() {
		return noticeImage;
	}
	public void setNoticeImage(NoticeImage noticeImage) {
		this.noticeImage = noticeImage;
	}
	public String getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(String codeNo) {
		this.codeNo = codeNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	

    
}
