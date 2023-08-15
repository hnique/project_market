package com.market.like.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Like {
	private int id;
	private int userId;
	private int postId;
	private ZonedDateTime createdAt;
}
