package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Admin;
import kr.co.tripadvisor.repository.domain.Paging;

public interface PagingMapper {
	int totalAdminCount();
	List<Admin> listAdminAccountAll(Paging paging);
}
