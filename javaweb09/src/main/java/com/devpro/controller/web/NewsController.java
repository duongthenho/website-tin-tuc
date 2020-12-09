package com.devpro.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.controller.BaseController;
import com.devpro.entities.News;
import com.devpro.repositories.CategoryRepo;
import com.devpro.repositories.NewsRepo;
import com.devpro.service.CommentService;
import com.devpro.service.NewsService;

@Controller
public class NewsController extends BaseController {
	
	@Autowired
	CategoryRepo categoryRepo;
	
	@Autowired
	NewsService newService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	NewsRepo newsRepo;
	
	@RequestMapping(value = "/news/category/{id}", method = RequestMethod.GET)
	public String getFoosBySimplePathWithPathVariable(@PathVariable("id") Long id, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		String page = request.getParameter("page");
		Pageable pageable = PageRequest.of(Integer.parseInt(page)-1, 4);
		
		Page<News> list=  newsRepo.findByCategoryid(id,pageable);
		
		model.addAttribute("page", page);
		model.addAttribute("totalPage", list.getTotalPages());
		model.addAttribute("listNews", list.getContent());		
		return "web/news/list";
	}
	@RequestMapping(value = "/news/detail/{id}", method = RequestMethod.GET)
	public String getDetailNews(@PathVariable("id") Long id, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		model.addAttribute("news", newService.findNews(id));
		model.addAttribute("listNews", newService.findNewsByNearTime(10, 0));
		model.addAttribute("comments", commentService.findListCommentByNews(id));
		return "web/news/detail";
	}
}
