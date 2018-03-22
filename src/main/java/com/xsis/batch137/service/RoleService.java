package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.RoleDao;
import com.xsis.batch137.model.Role;

@Service
@Transactional
public class RoleService {

	@Autowired
	RoleDao rd;
	
	public List<Role> selectAll(){
		return rd.selectAll();
	}
}
