package com.xsis.batch137.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="employee_outlet")
public class EmployeeOutlet {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	
	@OneToOne
	@JoinColumn(name="employee_id", nullable=false)
	private Employee employee;
	
	@ManyToOne
	@JoinColumn(name="outlet_id", nullable=false)
	private Outlet outlet;
}
