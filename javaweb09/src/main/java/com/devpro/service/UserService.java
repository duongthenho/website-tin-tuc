package com.devpro.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.constant.SystemConstant;
import com.devpro.entities.User;
import com.devpro.repositories.UserRepo;



@Service
public class UserService {
	@PersistenceContext
	protected EntityManager entityManager;
	@Autowired
	UserRepo userRepo;
	
	public User loadUserByUsername(String userName) {
		try {
//			String jpql = "From User u Where u.username=" + userName;
			String sql = "select * from User where status=1 and username= '"+userName+"'";
//			Query query = entityManager.createQuery(jpql, News.class);
			Query query = entityManager.createNativeQuery(sql, User.class);
			return (User) query.getResultList().get(0);
		} catch (Exception e) {
//			e.printStackTrace();
			return null;
		}
	}
	
	public User findUserByUserName(String userName) {
		try {
//			String jpql = "From User u Where u.username=" + userName;
			String sql = "select * from User where username= '"+userName+"'";
//			Query query = entityManager.createQuery(jpql, News.class);
			Query query = entityManager.createNativeQuery(sql, User.class);
			return (User) query.getResultList().get(0);
		} catch (Exception e) {
//			e.printStackTrace();
			return null;
		}
	}
	
	public User findUserById(Long id) {
		try {
//			String jpql = "From User u Where u.username=" + userName;
			String sql = "select * from User where id= '"+id+"'";
//			Query query = entityManager.createQuery(jpql, News.class);
			Query query = entityManager.createNativeQuery(sql, User.class);
			return (User) query.getResultList().get(0);
		} catch (Exception e) {
//			e.printStackTrace();
			return null;
		}
	}
	
	public  String saveUser(String repeatPassword, MultipartFile[] newAvatar, User user) throws Exception {
		try {
			if(user.getUserName().equals("") || user.getPassword().equals("") || user.getFullName().equals("") )
				return SystemConstant.submitBlank;
			if(newAvatar[0].getSize() > 0 && newAvatar.length > 0) {
				user.setAvatar("data:image/png;base64,"+StringUtils.newStringUtf8(Base64.encodeBase64(newAvatar[0].getBytes(),false)));
			}
			else {
				user.setAvatar("/web/img/th.jpg");
			}
			
			if(!repeatPassword.equals(user.getPassword()))
				return SystemConstant.errorPassword;
			if(findUserByUserName(user.getUserName()) instanceof User) {
				return SystemConstant.errorUser;
			}
			user.setStatus(1);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);
			user.setPassword(encoder.encode(user.getPassword()));
			userRepo.save(user);
			user.setPassword("");
			return SystemConstant.registerSucess;
		}catch (Exception e) {
			return SystemConstant.error;
		}
	}

}
