package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.Admin;

public interface AdminMapper {
	Admin selectAdminInfo(String id);
	List<Admin> selectAdminAll();
	void insertAdmin(Admin admin);
	void deleteAdmin(String id);
}
