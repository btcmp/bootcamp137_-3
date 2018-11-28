package com.xsis.batch137.dao.impl;

import java.util.List;

import com.xsis.batch137.dao.RegionDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;

@Repository
public class RegionDaoImpl implements RegionDao {

	@Autowired
	SessionFactory sessionFactory;

	public List<Region> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Region.class).list();
	}

	public List<Region> getRegionByProvince(Province province) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Region reg where reg.active = 1 and reg.province = :a";
		List<Region> regions = session.createQuery(hql).setParameter("a", province).list();
		if (regions == null) {
			return null;
		}
		return regions;
	}
	
	
}
