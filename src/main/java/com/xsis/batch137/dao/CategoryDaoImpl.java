package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Autowired
	SessionFactory sessionFactory;

	public void save(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(category);
		session.flush();
	}

	public void update(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(category);
		session.flush();
	}

	public void delete(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(category);
		session.flush();
	}

	public List<Category> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Category.class).list();
	}

	public Category getOne(String id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Category.class, id);
	}
	
	
}
