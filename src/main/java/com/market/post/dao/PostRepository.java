package com.market.post.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.market.post.entity.PostEntity;

@Repository
public interface PostRepository extends JpaRepository<PostEntity, Integer>{

	public PostEntity findAllById(int postId);
	public List<PostEntity> findAllByUserId(int userId);
	List<PostEntity> findBySubjectContaining(String keyword);
	List<PostEntity> findAllByCategoryId(int categoryId);
}
