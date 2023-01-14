package com.example.demo.Auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.User;
import com.example.demo.entities.UserRepo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
@RequestMapping("/auth")
public class AuthController {
	@Autowired
	private AuthService service;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	private UserRepo userRepo;
	@PostMapping("/register")
	public ResponseEntity<ObjectNode> register(@RequestBody User user)
	{
		System.out.println(user);
		ObjectNode objectNode=objectMapper.createObjectNode();
		objectNode.put("success", true);
		objectNode.put("token", service.register(user));
		System.out.println(objectNode);
		return ResponseEntity.ok(objectNode);
	}
	
	@PostMapping("/authenticate")
	public ResponseEntity<ObjectNode> authenticate(@RequestBody User user)
	{
		System.out.println(user);
		ObjectNode objectNode=objectMapper.createObjectNode();
		objectNode.put("success", true);
		objectNode.put("token", service.authenticate(user));
		System.out.println(objectNode);
		return ResponseEntity.ok(objectNode);
	}
	
	@PostMapping("/getuserid")
	public ResponseEntity<ObjectNode> getuserid(@RequestHeader("Authorization") String token)
	{
		String email=AuthTokenHandler.GetEmailFromAuthToken(token);
		System.out.println(email);
		User cUser=userRepo.findByEmail(email).orElse(null);
		ObjectNode objectNode=objectMapper.createObjectNode();
		if(cUser==null)
		{
			objectNode.put("success", false);
		}
		else {
			objectNode.put("success", true);
			objectNode.put("id"	, cUser.getId());
			objectNode.put("author",cUser.getUname());
		}
		return ResponseEntity.ok(objectNode);
	}
}
