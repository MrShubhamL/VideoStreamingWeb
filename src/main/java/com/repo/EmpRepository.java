package com.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Employee;

public class EmpRepository{
	public Connection conn;

	public EmpRepository(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean register(Employee e) {
		boolean f = false;
		try {
			String query = "insert into emp_details (empName,empEmail,empContact,empDepartment, password) values (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, e.getEmpName());
			ps.setString(2, e.getEmpEmail());
			ps.setString(3, e.getEmpContact());
			ps.setString(4, e.getEmpDepartment());
			ps.setString(5, e.getPassword());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return f;
	}
	
	public List<Employee> allEmployees()
	{
		List<Employee> listEmp = new ArrayList<Employee>();
		Employee emp = null;
		try {
			String query = "select * from emp_details";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				emp = new Employee();
				emp.setId(rs.getInt(1));
				emp.setEmpName(rs.getString(2));
				emp.setEmpEmail(rs.getString(3));
				emp.setEmpContact(rs.getString(4));
				emp.setEmpDepartment(rs.getString(5));
				listEmp.add(emp);
			}
			
		}catch (Throwable e) {
			System.out.println(e);
		}
		return listEmp;
	}
	
	public Employee loginNow(String email, String password) throws SQLException {
		Employee emp = null;
		String query = "select * from emp_details where empEmail=? and password=?";
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			emp = new Employee();
			emp.setId(rs.getInt(1));
			emp.setEmpName(rs.getString(2));
			emp.setEmpEmail(rs.getString(3));
			emp.setEmpContact(rs.getString(4));
			emp.setEmpDepartment(rs.getString(5));
			emp.setPassword(rs.getString(6));
		}
		return emp;
	}
}
