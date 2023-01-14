package com.example.demo.entities;

import java.util.Base64;
import java.util.Date;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Blog {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int blogid;
	
	private int userid;
	private String title;
	@Column(length = 100000)
	private String body;
	private String author;
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Column(columnDefinition = "varchar(255) default 'General'")
	private String category;
	private Date date;
	private byte[] img;
	public int getUserid() {
		return userid;
	}
	public int getId() {
		return this.blogid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getImg() {
		byte[] bytesEncoded = Base64.getEncoder().encode(img);
		return new String(bytesEncoded);
	}
	public void setImg(byte[] img) {
		this.img = img;
	}
	public Blog(int userid, String author,String title, String body, String category, Date date, byte[] img) {
		super();
		this.userid = userid;
		this.author=author;
		this.title = title;
		this.body = body;
		this.category = category;
		this.date = date;
		this.img = img;
	}
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
