package com.zeljko.springdemo.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zeljko.springdemo.user.CrmUser;


@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Autowired
	private UserDetailsManager userDetailsManager;
	
	

	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	private Logger logger = Logger.getLogger(getClass().getName());

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {

		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/showRegistrationForm")
	public String showMyLoginPage(Model theModel) {

		theModel.addAttribute("crmUser", new CrmUser());

		return "registration-form";

	}
	
	
	
	@GetMapping("/showDeleteForm")
	public String showMyLoginPage2(Model theModel) {

		theModel.addAttribute("crmUser", new CrmUser());

		return "delete-form";

	}

	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser,
			BindingResult theBindingResult, Model theModel) {

		String userName = theCrmUser.getUserName();

		logger.info("Processing registration form for: " + userName);

		// form validation
		if (theBindingResult.hasErrors()) {

			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name/password can not be empty.");

			logger.warning("User name/password can not be empty.");

			return "registration-form";
		}

		// check the database if user already exists
		boolean userExists = doesUserExist(userName);

		if (userExists) {
			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "Username already exists.");

			logger.warning("Username already exists.");

			return "registration-form";
		}

		
		// encrypt the password
		String encodedPassword = passwordEncoder.encode(theCrmUser.getPassword());

		// prepend the encoding algorithm id
		encodedPassword = "{bcrypt}" + encodedPassword;

		// give user default role of "employee"
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_ZAPOSLENI");

		// create user object (from Spring Security framework)
		User tempUser = new User(userName, encodedPassword, authorities);

		// save user in the database
		userDetailsManager.createUser(tempUser);

		logger.info("Successfully created user: " + userName);

		return "registration-confirmation";
	}
	
	@PostMapping("/processDeleteForm")
	public String processDeleteForm(@Valid @ModelAttribute("crmUser") CrmUser theCrmUser,
			BindingResult theBindingResult, Model theModel) {

		String userName = theCrmUser.getUserName();

		logger.info("Processing delete form for: " + userName);

		// form validation
		if (theBindingResult.hasErrors()) {

			theModel.addAttribute("crmUser", new CrmUser());
			theModel.addAttribute("registrationError", "User name/password can not be empty.");

			logger.warning("User name/password can not be empty.");

			return "delete-form";
		}

		// check the database if user already exists
		boolean userExists = doesUserExist(userName);

		if (!userExists) {
		
			theModel.addAttribute("registrationError", "User does not exist.");

			logger.warning("User does not exist.");

			return "delete-form";
		}

		// save user in the database
		userDetailsManager.deleteUser(userName);;

		logger.info("Successfully deleted user: " + userName);

		return "delete-confirmation";
	}

	private boolean doesUserExist(String userName) {

		logger.info("Checking if user exists: " + userName);

		// check the database if the user already exists
		boolean exists = userDetailsManager.userExists(userName);

		logger.info("User: " + userName + ", exists: " + exists);

		return exists;
	}

}
