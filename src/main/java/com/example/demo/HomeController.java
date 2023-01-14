package com.example.demo;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Auth.AuthTokenHandler;
import com.example.demo.entities.Blog;
import com.example.demo.entities.BlogRepo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import io.jsonwebtoken.io.IOException;

@Controller
 public class HomeController {
	@Autowired
	BlogRepo blogRepo;
	@Autowired
	private ObjectMapper objectMapper;
	
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView myView=new ModelAndView();
		myView.addObject("page","login");
		myView.setViewName("basic.jsp");
		return myView;
	}
	
	@RequestMapping("/signup")
	public ModelAndView signup() {
		ModelAndView myView=new ModelAndView();
		myView.addObject("page","signup");
		myView.setViewName("basic.jsp");
		return myView;
	} 
	
	@RequestMapping("/create")
	public ModelAndView createblog() {
		ModelAndView myView=new ModelAndView();
		myView.addObject("page","create");
		myView.setViewName("basic.jsp");
		return myView;
	}
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView myView=new ModelAndView();
		List<Blog> blogs=blogRepo.findAll();
		myView.addObject("allblogs",blogs);
		myView.setViewName("basic.jsp");
		myView.addObject("page","home");
		return myView;
	}
	
	@RequestMapping("/viewblog")
	public ModelAndView viewblog(@RequestParam String blogid){
		ModelAndView myView=new ModelAndView();
		Blog displayBlog=blogRepo.findById(Integer.parseInt(blogid)).orElse(null);
		myView.addObject("page","showblog");
		myView.addObject("blog",displayBlog);
		System.out.println(blogid);
		myView.setViewName("basic.jsp");
		return myView;
	}
	 
	@RequestMapping("/editblog")
	public ModelAndView editblog(@RequestParam String blogid){
		ModelAndView myView=new ModelAndView();
		Blog displayBlog=blogRepo.findById(Integer.parseInt(blogid)).orElse(null);
		myView.addObject("page","edit");
		myView.addObject("blog",displayBlog);
		System.out.println(blogid);
		myView.setViewName("basic.jsp");
		return myView;
	}
	
	@RequestMapping("/deleteblog")
	public String deleteblog(@RequestParam String blogid){
		blogRepo.deleteById(Integer.parseInt(blogid));
		return "redirect:/";
	}
	
	@PostMapping("/updateblog")
	public String updateblog(@RequestParam Map<String,Object> hpHashMap, @RequestParam("myfile") MultipartFile imgfile) throws java.io.IOException
	{
		 
		System.out.println(hpHashMap);
		int bid=Integer.parseInt(hpHashMap.get("id").toString());
		Blog blg=blogRepo.findById(bid).orElse(null);
		blg.setBody(hpHashMap.get("Body").toString());
		blg.setTitle(hpHashMap.get("Title").toString());
		byte[] img=imgfile.getBytes();

		blg.setCategory(hpHashMap.get("cat").toString());
		blg.setDate(new Date());
		if(!imgfile.isEmpty())
		blg.setImg(img);
		blogRepo.save(blg);
		return "done";
	}
	
	
	@PostMapping(value = "/create",consumes=MediaType.ALL_VALUE)
	public ResponseEntity<ObjectNode> createblog(@RequestParam Map<String,Object> hpHashMap, @RequestParam("myfile") MultipartFile imgfile) throws IOException, java.io.IOException
	{
		System.out.println(hpHashMap);
 		byte[] img=imgfile.getBytes();
		Blog blgBlog=new Blog(Integer.parseInt((String) hpHashMap.get("id")),hpHashMap.get("author").toString(),hpHashMap.get("Title").toString(),hpHashMap.get("Body").toString(),hpHashMap.get("cat").toString(),new Date(),img);
		System.out.println(blgBlog);
		blogRepo.save(blgBlog);
		ObjectNode objectNode=objectMapper.createObjectNode();
		objectNode.put("success", true);
 		System.out.println(objectNode);
 		return ResponseEntity.ok(objectNode);
	}
	
	@RequestMapping("/yourblogs")
	public ModelAndView yourblogs(@RequestParam String uid)
	{
		int userid=Integer.parseInt(uid);
		List<Blog> yourBlogs=blogRepo.findByuserid(userid);
		System.out.println(yourBlogs.size());
		ModelAndView myView=new ModelAndView();
		myView.addObject("allblogs",yourBlogs);
		myView.addObject("page","yourblogs");
		myView.setViewName("basic.jsp");
		return myView;
	}
	
	@RequestMapping(value = "/{spring:\\w+}")	
	public String notfound() {
	return "basic.jsp";
	}
}