package com.market.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.common.FileManagerService;
import com.market.post.dao.PostRepository;
import com.market.post.entity.PostEntity;

@Service
public class PostBO {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private FileManagerService fileManager;
	
	public List<PostEntity> getPostList(int userId) {
		return postRepository.findAllByUserId(userId);
	}
	
	public PostEntity getPostByPostIdAndUserId(int postId, int userId) {
		return postRepository.findAllByIdAndUserId(postId, userId);
	}
	
	public PostEntity addPost(int userId, String userLoginId, String postType, String subject, 
			int price, int categoryId, String status, String content, MultipartFile file) {
		String imagePath = null;
		
		if (file != null) {
			imagePath = fileManager.saveFile(userLoginId, file);
		}
		
		return postRepository.save(
					PostEntity.builder()
					.userId(userId)
					.postType(postType)
					.subject(subject)
					.price(price)
					.categoryId(categoryId)
					.status(status)
					.content(content)
					.imagePath(imagePath)
					.build());
	}
}
