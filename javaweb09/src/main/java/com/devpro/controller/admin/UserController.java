package com.devpro.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.controller.BaseController;
import com.devpro.entities.Role;
import com.devpro.entities.User;
import com.devpro.repositories.RoleRepo;
import com.devpro.repositories.UserRepo;
import com.devpro.service.UserService;

@Controller(value = "/admin/user")
public class UserController extends BaseController {
	@Autowired
	UserRepo userRepo;
	
	@Autowired
	RoleRepo roleRepo;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = { "/admin/user/list" }, method = RequestMethod.GET)
	public String getList(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String role = request.getParameter("role");
		String page = request.getParameter("page");
		model.addAttribute("listRole", roleRepo.findAll());
		
		Pageable pageable = PageRequest.of(Integer.parseInt(page)-1, 3);
		Page<User> list = null;
		if(role.equals("0")) {
			 list =  userRepo.findAllAndSort(pageable);	
		}
		else {
			list = userRepo.findByRole(Long.parseLong(role), pageable);
		}
		model.addAttribute("listUser", list.getContent());
		model.addAttribute("totalPage", list.getTotalPages());
		model.addAttribute("page", page);
			return "admin/user/list";
	}
	
	@RequestMapping(value = { "/admin/user/add" }, method = RequestMethod.GET)
	public String addAdmin(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("user", new User());
		return "admin/user/add";
	}
	
	@RequestMapping(value = { "/admin/user/lock" }, method = RequestMethod.GET)
	public String lock(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");
		if(id.equals("2")) {
			return "redirect:/admin/user/list?role=0&page=1";
		}
		User user = userService.findUserById(Long.parseLong(id));
		user.setStatus(0);
		userRepo.save(user);
		return "redirect:/admin/user/list?role=0&page=1";
	}
	
	@RequestMapping(value = { "/admin/user/unlock" }, method = RequestMethod.GET)
	public String unlock(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");

		User user = userService.findUserById(Long.parseLong(id));
		user.setStatus(1);
		userRepo.save(user);
		return "redirect:/admin/user/list?role=0&page=1";
	}
	
	@RequestMapping(value = {"/admin/user/add"}, method = RequestMethod.POST)
	public String saveNews(@RequestParam("newsAvatar") MultipartFile[] newAvatar,@ModelAttribute("user") User user, 
			final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
					throws Exception {
		Role role = new Role();
		role.setId(1L);
		user.setRole(role);
		model.addAttribute("message", userService.saveUser(user.getPassword(), newAvatar, user));
		return "admin/user/add";
	}

}
