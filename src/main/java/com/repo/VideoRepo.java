package com.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Employee;
import com.model.Videos;


public class VideoRepo {
	public Connection conn;

	public VideoRepo(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean upload_video(Videos v) {
		boolean f = false;
		try {
			String query = "insert into videos (video_name,video_description,video_upload_date,video_url) values (?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, v.getVideo_name());
			ps.setString(2, v.getVideo_description());
			ps.setString(3, v.getVideo_upload_date());
			ps.setString(4, v.getVideo_url());
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return f;
	}
	
	public List<Videos> allVideos()
	{
		List<Videos> listVideos = new ArrayList<Videos>();
		Videos vi = null;
		try {
			String query = "select * from videos";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				vi = new Videos();
				vi.setId(rs.getInt(1));
				vi.setVideo_name(rs.getString(2));
				vi.setVideo_description(rs.getString(3));
				vi.setVideo_upload_date(rs.getString(4));
				vi.setVideo_url(rs.getString(5));
				listVideos.add(vi);
			}
			
		}catch (Throwable e) {
			System.out.println(e);
		}
		return listVideos;
	}
	
	public Videos get_video(String id) {
		Videos v = null;
		try {
			String query = "select * from videos where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				v = new Videos();
				v.setId(rs.getInt(1));
				v.setVideo_name(rs.getString(2));
				v.setVideo_description(rs.getString(3));
				v.setVideo_upload_date(rs.getString(4));
				v.setVideo_url(rs.getString(5));
			}
		}catch (Throwable e) {
			System.out.println(e.getMessage());
		}
		return v;
	}
	
	public boolean updateVideo(Videos vs) {
		boolean f = false;
		try {
			String query = "update videos set video_name=?,video_description=?,video_upload_date=?,video_url=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, vs.getVideo_name());
			ps.setString(2, vs.getVideo_description());
			ps.setString(3, vs.getVideo_upload_date());
			ps.setString(4, vs.getVideo_url());
			ps.setInt(5, vs.getId());
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return f;
	}
	
	public boolean deleteVideo(int id) {
		boolean f = false;
		try {
			String query = "delete from videos where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}catch (Throwable e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return f;
	}
}
