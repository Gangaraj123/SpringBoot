package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

import io.jsonwebtoken.io.IOException;

@SpringBootApplication
@ComponentScan({"com.example.demo"})
public class BootJpaProjApplication extends SpringBootServletInitializer{

	public static void main(String[] args) throws IOException, java.io.IOException {
		SpringApplication.run(BootJpaProjApplication.class, args);
 
	}
	@Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	      return builder.sources(BootJpaProjApplication.class);
	  }
}
