package com.devpro.controller.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.devpro.dto.AjaxResponse;
import com.devpro.entities.Comment;
import com.devpro.entities.News;
import com.devpro.entities.User;
import com.devpro.repositories.CommentRepo;

@Controller
public class CommentController {
	
	@Autowired CommentRepo commentRepo;
	
	@PostMapping(value = "/comment")
	public ResponseEntity<AjaxResponse> api (@RequestBody final Map<String, Object> data // co the hung du lieu (thay map bang object)
			,final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		System.out.println(data.get("idNews"));
		Comment comment = new Comment();
		News news = new News();
		User user = (User) session.getAttribute("USER");
		news.setId(Long.parseLong(String.valueOf(data.get("idNews"))));
		
		comment.setContent(String.valueOf(data.get("content")));
		comment.setNews(news);
		comment.setUser(user);
		commentRepo.save(comment);
		return ResponseEntity.ok(new AjaxResponse("", 500));
	}
}
