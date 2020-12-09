package com.devpro.controller.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.controller.BaseController;
import com.devpro.entities.User;
import com.devpro.repositories.CategoryRepo;
import com.devpro.service.NewsService;
import com.devpro.service.UserService;

@Controller
public class HomeController extends BaseController {
	
	@Autowired
	CategoryRepo categoryRepo;
	
	@Autowired
	UserService userService;
	
	@Autowired
	NewsService newsService;
	
	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		
		HttpSession session = request.getSession(true);
		
		if(session.getAttribute("USER") == null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (principal instanceof User) {
				session.setAttribute("USER",principal );
			}
		}
		
		model.addAttribute("topNews", newsService.findNewsByNearTime(2, 0));
		model.addAttribute("topNewsByCategory", newsService.findNewsByMaxCreatedDateGroupByCategory());
//		throw new  IOException();
		return "web/index";
		
	}
	
}
