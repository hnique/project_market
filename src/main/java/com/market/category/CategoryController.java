package com.market.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.market.category.bo.CategoryBO;
import com.market.post.bo.PostBO;
import com.market.post.domain.PostList;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryBO categoryBO;
	
	@Autowired
	private PostBO postBO;

	/**
	 * 카테고리 별 목록 페이지
	 * @param categoryId
	 * @param model
	 * @return
	 */
	@GetMapping("/post_list_view")
	public String postListView(
			@RequestParam("categoryId") int categoryId,
			Model model) {
		
		List<PostList> categoryList = postBO.getPostListByCategoryId(categoryId);
		String categoryName = categoryBO.getCategoryNameByCategoryId(categoryId);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("view", "category/postList");
		return "template/layout";
	}
}