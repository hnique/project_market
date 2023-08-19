package com.market.post.domain;

import com.market.post.entity.PostEntity;

import lombok.Data;

@Data
public class PostList {
	// 글
	private PostEntity post;
	
	// 카테고리
	private String category;
}
