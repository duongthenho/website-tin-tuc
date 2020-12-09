package com.devpro.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.entities.Comment;

@Repository
public interface CommentRepo extends JpaRepository<Comment, Long> {

}

