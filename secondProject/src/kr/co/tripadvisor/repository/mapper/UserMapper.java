package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.User;

public interface UserMapper {
	void insertUser(User user);
	List<User> selectUser();
	User selectUserById(String id);
	int updateUser(User user);
	int deleteUser(String id);
	void adminUpdateUser(User user);
	int selectIdCount(String id);
	int selectEmailCount(String email);
	String findId(User user);
	String findPass(User user);
	
	
	
	

}
