package com.devpro.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.entities.Role;
import com.devpro.entities.User;
import com.devpro.repositories.UserRepo;
import com.devpro.service.UserService;

@Controller
public class RegisterController {
	
	@Autowired
	UserRepo userRepo;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = { "devpro-register" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("user", new User());
		return "register";
	}
	
	@RequestMapping(value = {"/devpro-register"}, method = RequestMethod.POST)
	public String saveNews(@RequestParam("newsAvatar") MultipartFile[] newAvatar, @RequestParam("repeatPassword") String repeatPassword,
			@ModelAttribute("user") User user, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
					throws Exception {
		Role role = new Role();
		role.setId(2L);
		user.setRole(role);
		model.addAttribute("message", userService.saveUser(repeatPassword, newAvatar, user));
		return "register";
	}
}
