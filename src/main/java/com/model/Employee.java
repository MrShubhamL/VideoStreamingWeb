package com.model;

public class Employee {
	private int id;
	private String empName;
	private String empEmail;
	private String empContact;
	private String empDepartment;
	private String password;
	public Employee(int id,String empName, String empEmail, String empContact, String empDepartment, String passowrd) {
		super();
		this.id = id;
		this.empName = empName;
		this.empEmail = empEmail;
		this.empContact = empContact;
		this.empDepartment = empDepartment;
		this.password = passowrd;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpContact() {
		return empContact;
	}
	public void setEmpContact(String empContact) {
		this.empContact = empContact;
	}
	public String getEmpDepartment() {
		return empDepartment;
	}
	public void setEmpDepartment(String empDepartment) {
		this.empDepartment = empDepartment;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Employee [empName=" + empName + ", empEmail=" + empEmail + ", empContact=" + empContact
				+ ", empDepartment=" + empDepartment + "]";
	}
	
	
}
