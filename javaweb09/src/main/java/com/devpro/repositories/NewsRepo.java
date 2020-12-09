package com.devpro.repositories;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devpro.entities.News;



@Repository
public interface NewsRepo extends JpaRepository<News, Long> {
	@Query( value ="select *From News n Where n.categoryid=?1 order by createdDate DESC", countQuery = "select count(*) FROM news Where categoryid=?1", 
			 nativeQuery = true)
	Page<News> findByCategoryid(Long categoryid,Pageable pageable);

}

