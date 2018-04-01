package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Customer;


public interface CustomerDao {	
	public void save(Customer customer);
	public List<Customer> selectAll();
	public Customer getOne(Customer customer);
	public void update(Customer customer);
	public void delete(Customer customer);
	public List<Customer> getCustomerBySearchName(String search);
}