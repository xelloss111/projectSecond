package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Admin;
import kr.co.tripadvisor.repository.domain.Board;
import kr.co.tripadvisor.repository.domain.BoardSearch;
import kr.co.tripadvisor.repository.domain.Notice;
import kr.co.tripadvisor.repository.domain.Paging;
import kr.co.tripadvisor.repository.domain.Scrap;
import kr.co.tripadvisor.repository.domain.User;

public interface PagingMapper {
	int totalAdminCount();
	List<Admin> adminAccountListUp(Paging paging);
	
	int totalNoticeCount();
	List<Notice> noticeListUp(Paging paging);
	
	int totalUserCount();
	List<User> userListUp(Paging paging);
	
	int totalGalleryCount();
	List<Board> galleryListUp(Paging paging);
	int GalleryCountByCategory(BoardSearch search);
	
	// Board
	int BoardCountByCategory(BoardSearch search);
	int totalBoardCount();
	List<Board> boardListUp(Paging paging);
	
	
	int totalScrapCount();
	List<Scrap> scrapListUp(Paging paging);
	
}
