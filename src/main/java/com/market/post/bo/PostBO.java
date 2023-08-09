package com.market.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.post.dao.PostRepository;
import com.market.post.entity.PostEntity;

@Service
public class PostBO {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	
	public PostEntity addPost(int userId, String subject, int price, int categoryId, 
			String content, String postType, String status) {
		return postRepository.save(
					PostEntity.builder()
					.userId(userId)
					.subject(subject)
					.price(price)
					.categoryId(categoryId)
					.content(content)
					.postType(postType)
					.status(status)
					.build()
				);
	}
}
