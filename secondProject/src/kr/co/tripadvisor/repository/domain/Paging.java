package kr.co.tripadvisor.repository.domain;

public class Paging {
	private int pageNo;		// 페이지 번호
	private int totalCount;	// DB에서 불러온 ROW 총 개수
	private int countList;	// 한 페이지에 출력할 게시글의 개수
	private int totalPage;	// 총 페이지 수
	private int countPage; 	// 한 화면에 출력될 페이지 수
	private int startPage;  // 시작 페이지
	private int endPage;	// 끝 페이지
	private int startCount; // 한 페이지에 출력할 게시물 시작 번호
	private int endCount;	// 한 페이지에 출력할 게시물 끝 번호
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	
	public Paging(int totalCnt, int pageNum, int cntList, int cntPage) {
		this.totalCount = totalCnt;
		this.pageNo = pageNum;
		this.countList = cntList;
		this.countPage = cntPage; 
		paging();
	}
	
	
	public void paging() {
		
		totalPage = totalCount / countList;
		
		if (totalCount % countList > 0) {
			totalPage++;
		}
		
		if (totalPage < pageNo) {
			pageNo = totalPage;
		}
		
		startPage = ((pageNo - 1) / countList) * countList + 1;
		
		endPage = startPage + countPage - 1;
		
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		startCount = (pageNo -1 ) * countList + 1;
		endCount = pageNo * countList;
		
		/*
		if (startPage > 1) {
			System.out.print("<a href=\"?page=1\">처음</a>");
		}
		
		if (pageNo > 1) {
			System.out.println("<a href=\"?page=" + (pageNo - 1)  + "\">이전</a>");
		}
		
		for (int iCount = startPage; iCount <= endPage; iCount++) {
			if (iCount == pageNo) {
				System.out.print(" <b>" + iCount + "</b>");
			} else {
				System.out.print(" " + iCount + " ");
			}
		}
		
		if (pageNo < totalPage) {
			System.out.println("<a href=\"?page=" + (pageNo + 1)  + "\">다음</a>");
		}
		
		if (endPage < totalPage) {
			System.out.print("<a href=\"?page=" + totalPage + "\">끝</a>");
		}
		*/

	}
}
