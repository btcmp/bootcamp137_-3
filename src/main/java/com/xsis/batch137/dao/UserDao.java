package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.User;

public interface UserDao {

	void save(User user);
	
	void update(User user);
	
	List<User> selectAll();
	
	User getOne(long id);
	
	void delete(User user);
	
	User getUserByEmployee(Employee emp);
	
	List<User> getUserByUsername(String user);
	
	int countUserByUsername(String user);
	
	void nonaktif(long id);
	
	int ubahPassword(String password, long id);
}
