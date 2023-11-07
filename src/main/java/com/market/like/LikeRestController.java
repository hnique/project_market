package com.market.like;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.market.like.bo.LikeBO;

@RestController
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인을 먼저 해주세요");
			return result;
		}
		
		likeBO.likeToggle(postId, userId);
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	@DeleteMapping("/like/delete")
	public Map<String, Object> delete(
			@RequestParam(value = "idList[]", required=false) List<String> idList,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인을 먼저 해주세요");
			return result;
		}
		
		likeBO.deleteLikeByIdList(idList);
		result.put("code", 1);
		result.put("result", "성공");
				
		return result;
	}
}
