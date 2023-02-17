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
import com.model.Videos;
import com.repo.VideoRepo;

@WebServlet("/update_video")
public class UpdateVideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String v_name = req.getParameter("v_name");
		String v_desc = req.getParameter("v_desc");
		String v_upload_date = LocalDate.now().toString();
		String v_url = req.getParameter("v_url");
		int id = Integer.parseInt(req.getParameter("id"));
		HttpSession session = req.getSession();
		Videos vs = new Videos();
		vs.setVideo_description(v_desc);
		vs.setVideo_name(v_name);
		vs.setVideo_upload_date(v_upload_date);
		vs.setVideo_url(v_url);
		vs.setId(id);
		try {
			VideoRepo rep = new VideoRepo(DBConnection.getConnection());
			boolean cv = rep.updateVideo(vs);
			if(cv) {
				session.setAttribute("update_successfull", "");
				resp.sendRedirect("admin_board.jsp");
			}
			else {
				session.setAttribute("update_error", "");
				System.out.println("Unsuccessful");
				resp.sendRedirect("admin_board.jsp");
			}
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
}
