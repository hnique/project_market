package com.market.like;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.market.like.bo.LikeBO;
import com.market.post.bo.PostBO;
import com.market.post.entity.PostEntity;

@Controller
@RequestMapping("/like")
public class LikeController {
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private PostBO postBO;

	/**
	 * 찜 목록 페이지
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/wish_list_view")
	public String wishListView(Model model, HttpSession session) {
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("msg", "로그인을 먼저 해주세요.");
			model.addAttribute("url", "/user/sign_in_view");
			return "alert";
		}
		
		// 게시글 정보 model에 담기 (list로 받아서 list로 파라미터 넘기기)
		List<Integer> postIdList = likeBO.getPostIdByUserId(userId);
		List<PostEntity> postList = postBO.getPostListByPostIdList(postIdList);
		
		model.addAttribute("postList", postList);
		model.addAttribute("view", "like/wishList");
		return "template/layout";
	}
}
