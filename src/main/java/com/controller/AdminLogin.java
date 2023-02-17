package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Employee;

@WebServlet("/admin_login")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String empEmail = req.getParameter("emp_email");
		String empPassword = req.getParameter("emp_pass");
		
		HttpSession session = req.getSession();
		Employee emp = new Employee();
		emp.setEmpEmail("admin@gmail.com");
		emp.setEmpName("Admin");
		emp.setEmpContact("7769038180");
		emp.setEmpDepartment("Admin-Department");
		emp.setId(10003);
		emp.setPassword("admin@123");
		try {
			if(empEmail.equals(emp.getEmpEmail()) && empPassword.equals(emp.getPassword())) {
				session.setAttribute("login_user", emp);
				resp.sendRedirect("admin_board.jsp");
			}
			else {
				session.setAttribute("login_failed", "Unsuccessful");
				resp.sendRedirect("admin_login.jsp");
			}
			
		}catch (Throwable e) {
			System.out.println(e.getMessage());
		}
	}
}
