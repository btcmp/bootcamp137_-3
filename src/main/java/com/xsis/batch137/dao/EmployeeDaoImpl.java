package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Employee;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.saveOrUpdate(emp);
		session.flush();
	}

	public void update(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(emp);
		session.flush();
	}

	public void delete(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(emp);
		session.flush();
	}

	public List<Employee> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee where active = 1";
		List<Employee> emps =  session.createQuery(hql).list();
		if(emps == null) {
			return null;
		}
		else{
			return emps;
		}
	}

	public Employee getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Employee em = session.get(Employee.class, id);
		return em;
	}

	public void nonaktif(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Employee set active=0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
		session.flush();
	}

	public List<Employee> getEmployeeByEmail(String email) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee where lower(email) = :email";
		List<Employee> emps = session.createQuery(hql).setParameter("email", email).list();
		if(emps.isEmpty()) {
			return null;
		}
		else{
			return emps;
		}
	}

	public int countEmployeeByEmail(String email) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee where lower(email) = :email";
		List<Employee> emps = session.createQuery(hql).setParameter("email", email.toLowerCase()).list();
		if(emps.isEmpty()) {
			return 0;
		}
		else{
			return emps.size();
		}
	}

	public Employee getEmpByUsername(String username) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Employee where user.username = :username";
		List<Employee> emps = session.createQuery(hql).setParameter("username", username).list();
		if(emps.isEmpty()) {
			return null;
		}else {
			return emps.get(0);
		}
	}

	
}
