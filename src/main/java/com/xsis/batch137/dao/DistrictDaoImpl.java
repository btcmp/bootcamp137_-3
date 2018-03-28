package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.District;
import com.xsis.batch137.model.Region;

@Repository
public class DistrictDaoImpl implements DistrictDao{

	@Autowired
	SessionFactory sessionFactory;

	public List<District> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(District.class).list();
	}

	public List<District> getDistrictByRegion(Region region) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from District as dist where dist.region = :xxx and active = 1";
		List<District> districts = session.createQuery(hql).setParameter("xxx", region).list();
		if(districts == null) {
			return null;
		}
		else {
			return districts;
		}
		
	}
	
	
}
