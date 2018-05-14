package com.qzl.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.changling.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	public void login(String username,String password,String sessionId) {
		
	}
}
