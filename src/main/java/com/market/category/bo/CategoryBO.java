package com.market.category.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.category.dao.CategoryMapper;

@Service
public class CategoryBO {
	
	@Autowired
	private CategoryMapper categoryMapper;

	public String getCategoryNameByCategoryId(int categoryId) {
		return categoryMapper.selectCategoryNameByCategoryId(categoryId);
	}
}
