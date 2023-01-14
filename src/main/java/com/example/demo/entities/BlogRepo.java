package com.example.demo.entities;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogRepo extends JpaRepository<Blog, Integer>{
	List<Blog> findByuserid(int userid);
}
