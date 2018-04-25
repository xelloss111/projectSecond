package kr.co.tripadvisor.repository.domain;

import java.util.List;

public class BoardSearch {
	private List<String> attrList;
	private List<String> areaList;
	private String searchType;
	private String searchWord;
	private String [] areas;
	private String [] attracts;
	
	public String[] getAttracts() {
		return attracts;
	}
	public void setAttracts(String[] attracts) {
		this.attracts = attracts;
	}
	public String[] getAreas() {
		return areas;
	}
	public void setAreas(String[] areas) {
		this.areas = areas;
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
