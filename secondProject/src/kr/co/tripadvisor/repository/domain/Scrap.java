package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Scrap {
	private String id;
	private String codeNo;
    private Integer boardNo;
    private Integer scrapNo;
    private Date regDate;
    Board board;
    BoardImage boardImage;
    
	public BoardImage getBoardImage() {
		return boardImage;
	}
	public void setBoardImage(BoardImage boardImage) {
		this.boardImage = boardImage;
	}

	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	@Override
	public String toString() {
		return "Scrap [id=" + id + ", codeNo=" + codeNo + ", boardNo=" + boardNo + ", scrapNo=" + scrapNo + ", regDate="
				+ regDate + ", board=" + board + "]";
	}
}
