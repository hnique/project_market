package com.market.comment.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Comment {
	private int id;
	private int userId;
	private int postId;
	private String content;
	private ZonedDateTime createdAt;
}
