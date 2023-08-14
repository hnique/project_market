package com.market.category.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface CategoryMapper {

	public String selectCategoryNameByCategoryId(int categoryId);
}
