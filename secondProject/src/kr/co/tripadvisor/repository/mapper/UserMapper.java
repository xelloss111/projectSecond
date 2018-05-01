package kr.co.tripadvisor.repository.mapper;

import java.util.List;

import kr.co.tripadvisor.repository.domain.User;

public interface UserMapper {
	void insertUser(User user);
	List<User> selectUser();
	User selectUserById(String id);
	void updateUser(User user);
	void deleteUser(String id);
	
}
