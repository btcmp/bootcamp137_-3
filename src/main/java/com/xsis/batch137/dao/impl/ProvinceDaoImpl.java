package com.xsis.batch137.dao.impl;

import java.util.List;

import com.xsis.batch137.dao.ProvinceDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;

@Repository
public class ProvinceDaoImpl implements ProvinceDao {

	@Autowired
	SessionFactory sessionFactory;

	public List<Province> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Province where active = 1";
		List<Province> provinces = session.createQuery(hql).list();
		if (provinces == null) {
			return null;
		}
		else {
			return provinces;
		}
	}
	
	
}
