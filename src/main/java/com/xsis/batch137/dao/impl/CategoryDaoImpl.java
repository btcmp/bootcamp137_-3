package com.xsis.batch137.dao.impl;

import java.util.List;

import com.xsis.batch137.dao.CategoryDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	SessionFactory sessionFactory;

	public void save(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(category);
		session.flush();
	}
	
	//

	public void update(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Category set modifiedOn = :date, modifiedBy = :user, name = :name where id = :id";
		session.createQuery(hql).setParameter("date", category.getModifiedOn()).setParameter("id", category.getId()).setParameter("name", category.getName()).setParameter("user", category.getModifiedBy()).executeUpdate();
		session.flush();
	}
	
	//Sebenarnya hanya menonaktifkan, bukan men-delete
	public void delete(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Category set active = 0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
		session.flush();
	}

	public List<Category> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Category where active = 1";
		List<Category> categories = session.createQuery(hql).list();
		if(categories.isEmpty()) {
			return null;
		}
		return categories;
	}

	public Category getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Category.class, id);
	}

	public List<Category> searchCategory(String search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Category where active = 1 and lower(name) like :cat";
		List<Category> cats = session.createQuery(hql).setParameter("cat", "%"+search.toLowerCase()+"%").list();
		if(cats.isEmpty()) {
			return null;
		}
		else {
			return cats;			
		}
	}

	@Override
	public int countCategory(String name) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Category where lower(name) = :nama";
		List<Category> cats = session.createQuery(hql).setParameter("nama", name.toLowerCase()).list();
		if(cats.isEmpty()) {
			return 0;
		}
		return cats.size();
	}
	
	
}
