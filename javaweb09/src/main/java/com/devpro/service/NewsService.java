package com.devpro.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.constant.SystemConstant;
import com.devpro.entities.News;
import com.devpro.entities.User;
import com.devpro.repositories.NewsRepo;






@Service
public class NewsService {
@PersistenceContext protected EntityManager entityManager;

	@Autowired
	CategoryService categoryService;

	@SuppressWarnings("unchecked")
	public List<News> findNewsByNearTime(int limit, int offset) {
		// String jpql = "From Product p Where p.category.id=" + categoryId;
		String sql = "SELECT * FROM javaweb09.news ORDER BY createddate DESC LIMIT "+limit+ " offset "+ offset;
		//Query query = entityManager.createQuery(jpql, Product.class);
		Query query = entityManager.createNativeQuery(sql, News.class);
		return query.getResultList();
	}
	public News findNews(Long id) {
		// String jpql = "From News n Where n.id.id=" + id;
		String sql = "select * from news where id="+id;
		//Query query = entityManager.createQuery(jpql, News.class);
		Query query = entityManager.createNativeQuery(sql, News.class);
		System.out.println("------------------------"+query.getResultList().size());
		return (News) query.getResultList().get(0);
	}
	
	public List<News> findNewsByMaxCreatedDateGroupByCategory(){
		String sql;
		List<News> listNews = new ArrayList<News>();
		for (int i = 0; i < categoryService.listCategoryId().size(); i++) {
			sql = "select * from news  where categoryid = "+ categoryService.listCategoryId().get(i).getId()
					+" order by createdDate DESC limit 1;";
			Query query = entityManager.createNativeQuery(sql, News.class);
			
				try {
					listNews.add((News) query.getResultList().get(0));
				}
				catch (Exception e) {
				
				}
			
			
		}
		return listNews;
		
	}
	
	@Autowired private NewsRepo newsRepo;
	
	@Transactional(rollbackOn = {Exception.class})
	public String saveNews(MultipartFile[] newsAvatars, News news, HttpServletRequest request) throws Exception {
		try {
			//
			if(news.getContent().equals("") || news.getTitle().equals("") || news.getShortDescription().equals(""))
				return SystemConstant.submitBlank;
			if(newsAvatars[0].getSize() > 0 && newsAvatars.length > 0 ) {
				MultipartFile newsAvatar = newsAvatars[0];			
				news.setThumbnail("data:image/png;base64,"+StringUtils.newStringUtf8(Base64.encodeBase64(newsAvatar.getBytes(),false)));
			}
			else if (news.getId() == null) {
				return SystemConstant.submitBlank;
			}
			
			if(news.getId() != null) { // update
				News newsInDatabase = newsRepo.findById(news.getId()).get();
				if(news.getThumbnail() == null) 
					news.setThumbnail(newsInDatabase.getThumbnail());
				if(news.getCreatedBy() == null) 
					news.setCreatedBy(newsInDatabase.getCreatedBy());
				if(news.getCreatedDate2() == null)
					news.setCreatedDate(newsInDatabase.getCreatedDate2());
				newsRepo.save(news);
				A();
				return SystemConstant.editSuccess;
			} 
			else { // add
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				
				news.setCreatedDate(timestamp);
				HttpSession session = request.getSession(true);
				User user = (User) session.getAttribute("USER");
				news.setCreatedBy(user.getUsername());
				newsRepo.save(news);
				A();
				return SystemConstant.saveSuccess;
			}	
//			throw new Exception("Co tinh gay loi");			
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Transactional(rollbackOn = {Exception.class})
	public void A() throws Exception {
		//.....
		
	}
}
