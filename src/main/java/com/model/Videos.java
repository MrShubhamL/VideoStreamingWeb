package com.model;

public class Videos {
	private int id;
	private String video_name;
	private String video_description;
	private String video_upload_date;
	private String video_url;
	public Videos() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Videos(int id, String video_name, String video_description, String video_upload_date, String video_url) {
		super();
		this.id = id;
		this.video_name = video_name;
		this.video_description = video_description;
		this.video_upload_date = video_upload_date;
		this.video_url = video_url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	public String getVideo_description() {
		return video_description;
	}
	public void setVideo_description(String video_description) {
		this.video_description = video_description;
	}
	public String getVideo_upload_date() {
		return video_upload_date;
	}
	public void setVideo_upload_date(String video_upload_date) {
		this.video_upload_date = video_upload_date;
	}
	public String getVideo_url() {
		return video_url;
	}
	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
	
}
