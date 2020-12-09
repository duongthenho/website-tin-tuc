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
import com.devpro.entities.News;
import com.devpro.repositories.NewsRepo;
import com.devpro.service.NewsService;

@Controller(value = "/admin/news")
public class NewsController extends BaseController {

	
	  @Autowired NewsRepo newsRepo;
	  @Autowired NewsService newsService;

	@RequestMapping(value = { "/admin/news/list" }, method = RequestMethod.GET)
	public String getList(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String page = request.getParameter("page");
			
		Pageable pageable = PageRequest.of(Integer.parseInt(page)-1, 3);
		Page<News> list=  newsRepo.findAll(pageable);

		model.addAttribute("page", page);
		model.addAttribute("totalPage", list.getTotalPages());
		model.addAttribute("listNews", list.getContent());
		return "admin/news/list";
	}

	@RequestMapping(value = { "/admin/news/edit" }, method = RequestMethod.GET)
	public String setList(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");
		if(id !=null) {
			model.addAttribute("news",newsService.findNews(Long.parseLong(id)));
		}
		else {
			model.addAttribute("news",new News());
		}
		return "admin/news/edit";
	}

	@RequestMapping(value = {"/admin/news/delete"}, method = RequestMethod.GET)
	public String deleteNews(@RequestParam("id") String id
			, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
					throws Exception {
		
		newsRepo.deleteById(Long.parseLong(id));
		return "redirect:/admin/news/list?page=1";
	}
	
	@RequestMapping(value = {"/admin/news/edit"}, method = RequestMethod.POST)
	public String saveNews(@RequestParam("newsAvatar") MultipartFile[] newsAvatars, @ModelAttribute("news") News news
			, final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
					throws Exception {
		
		model.addAttribute("message",newsService.saveNews(newsAvatars, news, request));
		return "admin/news/edit";
	}

}
