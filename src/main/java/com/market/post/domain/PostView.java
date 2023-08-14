package com.market.post.domain;

import java.util.List;

import com.market.comment.domain.CommentView;
import com.market.post.entity.PostEntity;
import com.market.user.entity.UserEntity;

import lombok.Data;

@Data
public class PostView {
	// 글
	private PostEntity post;
	
	// 글쓴이
	private UserEntity user;
	
	// 카테고리
	private String category;
	
	// 댓글들
	private List<CommentView> commentList;
	
	// 좋아요 여부
	private boolean filledLike;
}
