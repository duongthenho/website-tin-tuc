package com.devpro.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.devpro.entities.Category;

@Service
public class CategoryService {
	@PersistenceContext protected EntityManager entityManager;
	
	@SuppressWarnings("unchecked")
	List<Category> listCategoryId(){
		String sql= "select id from category;";
		Query query = entityManager.createNativeQuery(sql, Category.class);
		return query.getResultList();
	}
}
