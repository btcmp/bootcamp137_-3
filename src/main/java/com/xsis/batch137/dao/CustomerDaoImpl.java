package com.xsis.batch137.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xsis.batch137.model.Category;
import com.xsis.batch137.model.Customer;
import com.xsis.batch137.model.Item;
import com.xsis.batch137.model.ItemVariant;
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
	
	public List<Item> getCustomerEmail(Category category) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Item where category = :id and active = 1";
		List<Item> items = session.createQuery(hql).setParameter("id", category).list();
		if (items.isEmpty()) {
			return null;
		}
		return items;
	}
	
	@Override
	public int getCustomerEmail(String search) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Customer where lower(email) = :email";
		List<Customer> ivt = session.createQuery(hql).setParameter("email", search.toLowerCase()).list();
		if(ivt.isEmpty()) {
			return 0;
		}
		else{
			return ivt.size();
		}
	}
}
