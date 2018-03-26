package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Employee;
import com.xsis.batch137.model.EmployeeOutlet;
import com.xsis.batch137.model.Outlet;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
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
		session.clear();
		List<Employee> emps =  session.createQuery(hql).list();
		session.flush();
		if(emps == null) {
			return null;
		}
		return emps;
	}

	public Employee getOne(Employee emp) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		Employee em = session.get(Employee.class, emp.getId()); 
		for(Outlet ou : em.getOutlets()) {
			System.out.println(ou.getId());
		}
		for(EmployeeOutlet eo : em.getEmpOutlet()) {
			System.out.println(eo.getOutlet().getName());
		}
		System.out.println(em.getUser().getUsername());
		return em;
	}

	public void nonaktif(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Employee set active=0 where id = :id";
		session.createQuery(hql).setParameter("id", id).executeUpdate();
		session.flush();
	}

	
}
