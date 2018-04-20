package kr.co.tripadvisor.repository.domain;

import java.util.List;

public class BoardSearch {
	private List<String> attrList;
	private List<String> areaList;
	private String searchType;
	private String searchWord;
	private int boardType;
	
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public List<String> getAttrList() {
		return attrList;
	}
	public void setAttrList(List<String> attrList) {
		this.attrList = attrList;
	}
	public List<String> getAreaList() {
		return areaList;
	}
	public void setAreaList(List<String> areaList) {
		this.areaList = areaList;
	}
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
}
