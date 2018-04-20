package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Notice {
	private String codeNo;
    private Integer no;
    private String title;
    private String id;
    private String content;
    private Date regDate;
    private Date modDate;

    public String getCodeNo() {
        return codeNo;
    }
    public void setCodeNo(String codeNo) {
        this.codeNo = codeNo;
    }
    public Integer getNo() {
        return no;
    }
    public void setNo(Integer no) {
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
}
