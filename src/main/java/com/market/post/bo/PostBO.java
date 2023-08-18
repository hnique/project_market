package com.market.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	
	public PostEntity getPostById(int postId) {
		return postRepository.findAllById(postId);
	}
	
	public List<PostEntity> getPostList(int userId) {
		return postRepository.findAllByUserId(userId);
	}
	
	public List<PostEntity> getPostListByPostIdList(List<Integer> list) {
		return postRepository.findAllById(list);
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
	
	public void updatePost(int userId, String userLoginId, int postId, String postType, String subject, int price, 
			int categoryId, String status, String content, MultipartFile file) {
		
		PostEntity post = postRepository.findById(postId).orElse(null);
		
		String imagePath = null;
		if (file != null) {
			// 파일 업로드
			imagePath = fileManager.saveFile(userLoginId, file);
			
			// 기존 이미지 제거
			// ㄴ> 업로드가 성공 했고, 기존 이미지가 존재하는 경우에만 제거
			if (imagePath != null && post.getImagePath() != null) {
				// 이미지 제거
				fileManager.deleteFile(post.getImagePath());
			}
		}
		
		// 글 업데이트
		post = post.toBuilder()
				.userId(userId)
				.postType(postType)
				.subject(subject)
				.price(price)
				.categoryId(categoryId)
				.status(status)
				.content(content)
				.imagePath(imagePath)
				.build();
		
		postRepository.save(post);
	}
	
	public void deletePostByPostIdAndUserId(int postId, int userId) {
		PostEntity post = postRepository.findById(postId).orElse(null);
		if (post == null) {
			logger.error("### [delete post] postId:{}, userId:{}", postId, userId);
			return;
		}
		
		// 이미지가 있다면 이미지 삭제
		if (post.getImagePath() != null) {
			fileManager.deleteFile(post.getImagePath());
		}
		
		// 게시글 삭제
		postRepository.delete(post);
		
		// 댓글들 삭제
		commentBO.deleteCommentsByPostId(postId);
		
		// 찜하기 삭제
		likeBO.deleteLikeByPostId(postId);
	}
}
