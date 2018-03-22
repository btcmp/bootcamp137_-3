package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.User;

public interface UserDao {

	void save(User user);
	
	void update(User user);
	
	List<User> selectAll();
	
	User getOne(User user);
	
	void delete(User user);
}
