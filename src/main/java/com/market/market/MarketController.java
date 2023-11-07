package com.market.market;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.market.post.bo.PostBO;
import com.market.post.entity.PostEntity;

@Controller
@RequestMapping("/market")
public class MarketController {
	
	@Autowired
	private PostBO postBO;

	@GetMapping("/main_view")
	public String mainView(Model model,
			@PageableDefault(sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		
		List<PostEntity> postList = postBO.getPostByIdDesc(pageable);
		model.addAttribute("postList", postList);
		model.addAttribute("view", "market/main");
		return "template/layout";
	}
}
