package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Scrap {
	private String codeNo;
    private Integer boardNo;
    private Integer scrapNo;
    private Date regDate;

    public String getCodeNo() {
        return codeNo;
    }
    public void setCodeNo(String codeNo) {
        this.codeNo = codeNo;
    }
    public Integer getBoardNo() {
        return boardNo;
    }
    public void setBoardNo(Integer boardNo) {
        this.boardNo = boardNo;
    }
    public Integer getScrapNo() {
        return scrapNo;
    }
    public void setScrapNo(Integer scrapNo) {
        this.scrapNo = scrapNo;
    }
    public Date getRegDate() {
        return regDate;
    }
    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
}
