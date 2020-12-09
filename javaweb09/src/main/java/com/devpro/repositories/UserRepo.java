package com.devpro.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devpro.entities.User;

import antlr.collections.List;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
	@Query( value ="select *From user n Where n.roleid=?1 order by username ASC", countQuery = "select count(*) FROM user Where roleid=?1", 
			 nativeQuery = true)
	Page<User> findByRole(Long role,Pageable pageable);
	
	@Query( value ="select *From user order by username ASC", countQuery = "select count(*) FROM user", 
			 nativeQuery = true)
	Page<User> findAllAndSort(Pageable pageable);
	
	@Query( value ="update user set status = 1 where id =?1", 
			 nativeQuery = true)
	List unlockUser(Long id);
	
	@Query( value ="update user set status = 0 where id =?1", 
			 nativeQuery = true)
	List lockUser(Long id);
}

