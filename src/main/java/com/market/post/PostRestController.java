package com.market.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.market.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;

	/**
	 * 게시글 등록 API
	 * @param postType
	 * @param subject
	 * @param price
	 * @param categoryId
	 * @param status
	 * @param content
	 * @param file
	 * @param session
	 * @return
	 */
	@PostMapping("/write")
	public Map<String, Object> write(
			@RequestParam("postType") String postType,
			@RequestParam("subject") String subject,
			@RequestParam("price") int price,
			@RequestParam("categoryId") int categoryId,
			@RequestParam("status") String status,
			@RequestParam("content") String content,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		// insert DB
		postBO.addPost(userId, userLoginId, postType, subject, price, categoryId, status, content, file);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
