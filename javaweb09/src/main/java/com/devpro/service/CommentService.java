package com.devpro.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.devpro.entities.Comment;

@Service
public class CommentService {
	@PersistenceContext protected EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	public List<Comment> findListCommentByNews(Long newsId) {
		// String jpql = "From Product p Where p.category.id=" + categoryId;
		String sql = "select * from comment where new_id="+newsId;
		//Query query = entityManager.createQuery(jpql, Product.class);
		Query query = entityManager.createNativeQuery(sql, Comment.class);
		return query.getResultList();
	}
}
