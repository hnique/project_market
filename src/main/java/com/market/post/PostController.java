package com.market.post;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	/**
	 * 판매등록 페이지
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/write_sale_post_view")
	public String writeSalePostView(Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		
		model.addAttribute("view", "post/writeSalePost");
		return "template/layout";
	}
	
	/**
	 * 구매등록 페이지
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/write_purchase_post_view")
	public String writePurchasePostView(Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		
		model.addAttribute("view", "post/writePurchasePost");
		return "template/layout";
	}
	
	@GetMapping("/my_page_view")
	public String myPageView(Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		
		model.addAttribute("view", "post/myPage");
		return "template/layout";
	}
}
