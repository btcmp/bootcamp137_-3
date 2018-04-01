package com.xsis.batch137.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xsis.batch137.dao.CustomerDao;
import com.xsis.batch137.model.Customer;


@Service
@Transactional
public class CustomerService {
	@Autowired
	CustomerDao customerDao;
	
	public void save(Customer customer) {
		customerDao.save(customer);
	}

	public List<Customer> selectAll(){
		return customerDao.selectAll();
	}
	
	public Customer getOne(long id) {
		Customer customer = new Customer();
		customer.setId(id);
		return customerDao.getOne(customer);
	}
	
	public void update(Customer customer) {
		customerDao.update(customer);
	}
	
	public void delete(Customer customer) {
		customerDao.delete(customer);
	}
	
	public List<Customer> getCustomerBySearchName(String search) {
		// TODO Auto-generated method stub
		return customerDao.getCustomerBySearchName(search);
	}
	
	
	
}