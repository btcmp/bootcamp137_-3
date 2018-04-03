package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.EmployeeOutlet;
import com.xsis.batch137.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
		session.flush();
	}

	public void update(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(user);
		session.flush();
	}

	public List<User> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(User.class).list();
	}

	public User getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(User.class, id);
	}

	public void delete(User user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(user);
		session.flush();
	}

	public User getUserByEmployee(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where employee = :emp";
		List<User> user = session.createQuery(hql).setParameter("emp", emp).list();
		if(user.isEmpty()) {
			return null;
		}else {
			return user.get(0);
		}
	}

	public List<User> getUserByUsername(String user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where lower(username) = :username";
		List<User> users = session.createQuery(hql).setParameter("username", user.toLowerCase()).list();
		if(users.isEmpty()) {
			return null;
		}
		else{
			return users;
		}
	}

	public int countUserByUsername(String user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from User where lower(username) = :username";
		List<User> users = session.createQuery(hql).setParameter("username", user.toLowerCase()).list();
		if(users.isEmpty()) {
			return 0;
		}
		else{
			return users.size();
		}
	}

	public void nonaktif(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update User set active=0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
		session.flush();
	}

}
