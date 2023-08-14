package com.market.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.category.bo.CategoryBO;
import com.market.comment.bo.CommentBO;
import com.market.comment.domain.CommentView;
import com.market.common.FileManagerService;
import com.market.like.bo.LikeBO;
import com.market.post.dao.PostRepository;
import com.market.post.domain.PostView;
import com.market.post.entity.PostEntity;
import com.market.user.bo.UserBO;
import com.market.user.entity.UserEntity;

@Service
public class PostBO {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CategoryBO categoryBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private FileManagerService fileManager;
	
	public PostView generatePostView(int postId, Integer userId) {
		PostView postView = new PostView();
		
		// 게시글 세팅
		PostEntity post = postRepository.findAllById(postId);
		postView.setPost(post);
		
		// 글쓴이 세팅
		UserEntity user = userBO.getUserEntityById(post.getUserId());
		postView.setUser(user);
		
		// 카테고리
		String category = categoryBO.getCategoryNameByCategoryId(post.getCategoryId());
		postView.setCategory(category);
		
		// 댓글들 세팅
		List<CommentView> commentViewList = commentBO.generateCommentViewList(post.getId());
		postView.setCommentList(commentViewList);

		// 좋아요 여부
		boolean filledLike = likeBO.filledLike(post.getId(), userId);
		postView.setFilledLike(filledLike);
		
		return postView;	
	}
	
	public List<PostEntity> getPostList(int userId) {
		return postRepository.findAllByUserId(userId);
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
