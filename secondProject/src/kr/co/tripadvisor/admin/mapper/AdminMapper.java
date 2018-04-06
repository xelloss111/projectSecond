package kr.co.tripadvisor.admin.mapper;

import kr.co.tripadvisor.admin.domain.Admin;

public interface AdminMapper {
	Admin selectAdminInfo(String... value);
}
