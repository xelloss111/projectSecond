package kr.co.tripadvisor.repository.domain;

public class Paging {
	private int pageNo;		// 페이지 번호
	private int totalCount;	// DB에서 불러온 ROW 총 개수
	private int countList;	// 한 페이지에 출력할 게시글의 개수
	private int totalPage;	// 총 페이지 수
	private int blockSize; 	// 한 화면에 출력될 페이지 수
	private int startPage;  // 시작 페이지
	private int endPage;	// 끝 페이지
	private int startCount; // 한 페이지에 출력할 게시물 시작 번호
	private int endCount;	// 한 페이지에 출력할 게시물 끝 번호
	private boolean prev;
	private boolean next;
	
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
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	// 총 게시글 수, 페이지번호, 페이지 당 게시글 출력 개수, 페이지 번호 개수
	public Paging(int totalCount, int pageNo, int countList, int blockSize) {
		this.totalCount = totalCount;
		this.pageNo = pageNo;
		this.countList = countList;
		this.blockSize = blockSize; 
		paging();
	}
	
	public void paging() {
		
		// 총 페이지 수 구하기
		totalPage = (int)Math.ceil(totalCount / (double)countList);
		
		// 페이지 블록
		int currBlock = (pageNo - 1) / blockSize + 1;
		startPage = (currBlock - 1) * blockSize + 1;
		endPage = (currBlock * blockSize < totalPage) ? (currBlock * blockSize) : totalPage;
					
		// 각각의 페이지에 출력할 게시글 시작 및 끝 번호
		startCount = (pageNo - 1) * countList + 1;
		endCount = pageNo * countList;
	
		prev = startPage != 1;
		next = endPage != totalPage;
		
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
