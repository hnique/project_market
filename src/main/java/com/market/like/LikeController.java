package com.market.like;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/like")
public class LikeController {

	@GetMapping("/wish_list_view")
	public String wishListView(Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		
		model.addAttribute("view", "like/wishList");
		return "template/layout";
	}
}
