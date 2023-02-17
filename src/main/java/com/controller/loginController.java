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
import com.model.Videos;
import com.repo.EmpRepository;
import com.repo.VideoRepo;

@WebServlet("/loginNow")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String empEmail = req.getParameter("empEmail");
		String empPassword = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		try {
			EmpRepository remp = new EmpRepository(DBConnection.getConnection());
			Employee login_user = remp.loginNow(empEmail, empPassword);
			if(login_user!=null) {
				session.setAttribute("login_user", login_user);
				resp.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("login_failed", "Unsuccessful");
				resp.sendRedirect("index.jsp");
			}
			
		}catch (Throwable e) {
			System.out.println(e.getMessage());
		}
	}

}
