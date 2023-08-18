package com.market.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.market.category.bo.CategoryBO;
import com.market.post.bo.PostBO;
import com.market.post.domain.PostView;
import com.market.post.entity.PostEntity;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CategoryBO categoryBO;

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
	
	/**
	 * 게시글 상세 페이지
	 * @param postId
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/post_detail_view")
	public String postDetailView(
			@RequestParam("postId") int postId,
			Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		
		PostView postView = postBO.generatePostView(postId, userId);
		model.addAttribute("postView", postView);
		model.addAttribute("view", "post/postDetail");
		return "template/layout"; 
	}
	
	/**
	 * 게시글 수정 페이지
	 * @param postId
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/post_update_view")
	public String postUpdateView(
			@RequestParam("postId") int postId,
			Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		// 해당 게시글 정보 담기
		PostEntity post = postBO.getPostById(postId);
		String category = categoryBO.getCategoryNameByCategoryId(post.getCategoryId());
		model.addAttribute("post", post);
		model.addAttribute("category", category);
		model.addAttribute("view", "/post/postUpdate");
		return "template/layout";
	}
	
	/**
	 * 마이페이지
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/my_page_view")
	public String myPageView(Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		
		// 게시글 정보 model에 담기
		List<PostEntity> postList = postBO.getPostList(userId);
		model.addAttribute("postList", postList);
		model.addAttribute("view", "post/myPage");
		return "template/layout";
	}
	
	@GetMapping("/post_list_view")
	public String postListView(Model model) {
		
		model.addAttribute("view", "post/postList");
		return "template/layout";
	}
}
