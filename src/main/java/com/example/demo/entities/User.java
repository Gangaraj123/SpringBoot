package com.example.demo.entities;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class User implements UserDetails{
	@Id	
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	
	
	private String uname;
	
	@Column(unique = true)
	private String email;
	
	private String password;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User(String uname, String email, String password) {
		super();
		this.uname = uname;
		this.email = email;
		this.password = password;
	}
	public User() {
		super();
 	}
	@Override
	public String toString() {
		return "User [id=" + id + ", uname=" + uname + ", email=" + email + ", password=" + password + "]";
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}
	@Override
	public String getUsername() {
		
		return this.email; // to authenticate
	}
	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
	public int getId()
	{
		return this.id;
	}
	
}
