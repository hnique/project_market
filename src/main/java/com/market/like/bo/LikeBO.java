package com.market.like.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.like.dao.LikeMapper;

@Service
public class LikeBO {

	@Autowired
	private LikeMapper likeMapper;
	
	public void likeToggle(int postId, int userId) {
		if (likeMapper.selectLikeCountByPostIdOrUserId(postId, userId) > 0) {
			// 삭제
			likeMapper.deleteLikeByPostIdAndUserId(postId, userId);
		} else {
			// 추가
			likeMapper.insertLike(postId, userId);
		}
	}
	
	public boolean filledLike(int postId, Integer userId) {
		// 비로그인
		if (userId == null) {
			return false;
		}
		// 로그인
		return likeMapper.selectLikeCountByPostIdOrUserId(postId, userId) > 0;
	}
	
	// like 테이블의 postId list로 받아오기
	public List<Integer> getPostIdByUserId(int userId) {
		List<Integer> list = new ArrayList<>();
		list.addAll(likeMapper.selectPostIdByUserId(userId));
		return list;
	}
	
	public void deleteLikeByPostId(int postId) {
		likeMapper.deleteLikeByPostId(postId);
	}
	
	public void deleteLikeByIdList(List<String> postId) {
		if (postId != null) {
			if (postId.contains("on")) {
				postId.remove("on");
			}
			String[] ids = postId.toArray(new String[postId.size()]);
			int[] idList = new int[ids.length];
			
			for (int i = 0; i <ids.length; i++) {
				idList[i] = Integer.parseInt(ids[i]);
			}
			
			for (int i = 0; i < idList.length; i++) {
				likeMapper.deleteLikeByPostId(idList[i]);
			}
		}
	}
}
