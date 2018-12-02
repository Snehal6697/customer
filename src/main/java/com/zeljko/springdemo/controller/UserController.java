package com.zeljko.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zeljko.springdemo.entity.Users;
import com.zeljko.springdemo.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	// need to inject our user service
	private UserService userService;

	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/list")
	public String listUsers(Model theModel) {
		
		// get users from the service
		List<Users> theUsers = userService.getUsers();
				
		// add the users to the model
		theModel.addAttribute("users", theUsers);
		
		return "list_users";
	}

}










