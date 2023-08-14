package com.market.category.domain;

import java.time.ZonedDateTime;

import lombok.Data;

@Data
public class Category {
	private int id;
	private String categoryName;
	private ZonedDateTime createdAt;
}
