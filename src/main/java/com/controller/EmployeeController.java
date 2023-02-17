package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.model.Employee;
import com.repo.EmpRepository;


@WebServlet("/registerNow")
public class EmployeeController extends HttpServlet  {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String empName = req.getParameter("empName");
		String empEmail = req.getParameter("empEmail");
		String empContact = req.getParameter("empContact");
		String empDepartment = req.getParameter("empDepartment");
		String password = req.getParameter("password");
		
		Employee emp = new Employee();
		emp.setEmpName(empName);
		emp.setEmpEmail(empEmail);
		emp.setEmpContact(empContact);
		emp.setEmpDepartment(empDepartment);
		emp.setPassword(password);
		
		System.out.println(emp.toString());
		HttpSession session = req.getSession();
		try {
			EmpRepository empRepo = new EmpRepository(DBConnection.getConnection());
			boolean f = empRepo.register(emp);
			if(f) {
				Employee login_user = empRepo.loginNow(empEmail, password);
				if(login_user!=null) {
					session.setAttribute("success", "Successfuly Register");
					session.setAttribute("login_user", login_user);
					resp.sendRedirect("Welcome.jsp");
				}
				else {
					session.setAttribute("failed", "Unsuccessful");
					resp.sendRedirect("index.jsp");
				}
			}
			else {
				session.setAttribute("failed", "Unsuccessful");
				resp.sendRedirect("index.jsp");
			}
		}catch (Throwable e) {
			System.out.println(e.getMessage());
		}
	}

}
