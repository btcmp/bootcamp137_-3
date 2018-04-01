package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Customer;
import com.xsis.batch137.model.Outlet;



@Repository
public class CustomerDaoImpl implements CustomerDao{

	@Autowired 
	SessionFactory sessionFactory;

	public void save(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(customer);
		session.flush();
	}


	public List<Customer> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Customer.class).list();
	}

	public Customer getOne(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(Customer.class, customer.getId());
	}


	public void update(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(customer);
		session.flush();
	}

	
	public void delete(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(customer);
		session.flush();
	}

	public List<Customer> getCustomerBySearchName(String search) {
		// TODO Auto-generated method stub
		String hql = "from Customer Cust where lower(Cust.name) like:search";
		Session session = sessionFactory.getCurrentSession();
		List<Customer> customers = session.createQuery(hql).setParameter("search", "%"+search.toLowerCase()+"%").list();
		if(customers.isEmpty()) {
			return null;
		} else {
			return customers;			
		}
	}
}
