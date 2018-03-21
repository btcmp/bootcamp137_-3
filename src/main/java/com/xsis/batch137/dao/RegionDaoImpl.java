package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Region;

@Repository
public class RegionDaoImpl implements RegionDao{

	@Autowired
	SessionFactory sessionFactory;

	public List<Region> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Region.class).list();
	}
	
	
}
