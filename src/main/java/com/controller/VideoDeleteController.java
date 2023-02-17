package com.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.repo.VideoRepo;

@WebServlet("/delete_video")
public class VideoDeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		
		HttpSession session = req.getSession();

		try {
			VideoRepo rep = new VideoRepo(DBConnection.getConnection());
			boolean cv = rep.deleteVideo(id);
			if(cv) {
				session.setAttribute("delete_successfull", "");
				resp.sendRedirect("admin_board.jsp");
			}
			else {
				session.setAttribute("delete_error", "");
				System.out.println("Unsuccessful");
				resp.sendRedirect("admin_board.jsp");
			}
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
}
