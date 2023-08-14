package com.market.comment.domain;

import com.market.user.entity.UserEntity;

import lombok.Data;

@Data
public class CommentView {

	private Comment comment;
	
	private UserEntity user;
}
