package com.example.demo.Auth;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.config.JWTService;
import com.example.demo.entities.User;
import com.example.demo.entities.UserRepo;

@Service
public class AuthService {
	@Autowired
	private UserRepo userRepo;
	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	@Autowired
	private JWTService jwtService;
	@Autowired
	private AuthenticationManager authenticationManager;

	public String register(User tuser) {
		System.out.println(tuser);
		User user = new User(tuser.getUname(), tuser.getEmail(), passwordEncoder.encode(tuser.getPassword()));
		userRepo.save(user);
		var jwttoekn = jwtService.generateToken(user);
		return jwttoekn;
	}

	public String authenticate(User tuser) {
		authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(tuser.getEmail(), tuser.getPassword()));
		User user = userRepo.findByEmail(tuser.getEmail()).orElse(null);
		var jwttoekn = jwtService.generateToken(user);
		return jwttoekn;
	}

}
