package com.market.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.comment.dao.CommentMapper;
import com.market.comment.domain.Comment;
import com.market.comment.domain.CommentView;
import com.market.user.bo.UserBO;
import com.market.user.entity.UserEntity;

@Service
public class CommentBO {
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, int postId, String content) {
		return commentMapper.insertComment(userId, postId, content);
	}

	public List<CommentView> generateCommentViewList(int postId) {
		// 결과 리스트
		List<CommentView> commentViewList = new ArrayList<>();
		
		// 글에 해당하는 댓글들
		List<Comment> commentList = commentMapper.selectCommentListByPostId(postId);
		
		// 반복문 순회   comment => commentView     => commentViewList에 담는다.
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(comment);
			
			UserEntity user = userBO.getUserEntityById(comment.getUserId());
			commentView.setUser(user); // 댓글쓴이
			
			commentViewList.add(commentView);
		}
		return commentViewList;
	}
	
	public void deleteCommentById(int commentId) {
		commentMapper.deleteCommentById(commentId);
	}
	
	public void deleteCommentsByPostId(int postId) {
		commentMapper.deleteCommentsByPostId(postId);
	}
}
