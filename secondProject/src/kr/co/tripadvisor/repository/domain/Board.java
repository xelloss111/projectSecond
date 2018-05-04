package kr.co.tripadvisor.repository.domain;

import java.util.Date;

public class Board {

	String codeNo;
	int boardNo;
	String title;
	String id;
	String editordata;
	String area;
	String attract;
	Date regDate;
	Date modDate;
	int viewCnt;
	BoardImage boardImage;
	private String searchType;
	private String searchWord;

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public BoardImage getBoardImage() {
		return boardImage;
	}
	public void setBoardImage(BoardImage boardImage) {
		this.boardImage = boardImage;
	}
	public String getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(String codeNo) {
		this.codeNo = codeNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getEditordata() {
		return editordata;
	}
	public void setEditordata(String editordata) {
		this.editordata = editordata;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAttract() {
		return attract;
	}
	public void setAttract(String attract) {
		this.attract = attract;
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
	@Override
	public String toString() {
		return "Board [codeNo=" + codeNo + ", boardNo=" + boardNo + ", title=" + title + ", id=" + id + ", editordata="
				+ editordata + ", area=" + area + ", attract=" + attract + ", regDate=" + regDate + ", modDate="
				+ modDate + ", viewCnt=" + viewCnt + ", boardImage=" + boardImage + "]";
	}

}
