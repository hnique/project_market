package com.market.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.market.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	@PostMapping("/write")
	public Map<String, Object> write(
			@RequestParam("subject") String subject,
			@RequestParam("price") int price,
			@RequestParam("categoryId") int categoryId,
			@RequestParam("content") String content,
			@RequestParam("postType") String postType,
			@RequestParam("status") String status,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		// insert DB
		postBO.addPost(userId, subject, price, categoryId, content, postType, status);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
