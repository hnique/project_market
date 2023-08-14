package com.market.post.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.market.post.entity.PostEntity;

@Repository
public interface PostRepository extends JpaRepository<PostEntity, Integer>{

	public List<PostEntity> findAllByUserId(int userId);
	public PostEntity findAllByIdAndUserId(int postId, int userId);
}
