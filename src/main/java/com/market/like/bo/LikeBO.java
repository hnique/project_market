package com.market.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.like.dao.LikeMapper;

@Service
public class LikeBO {

	@Autowired
	private LikeMapper likeMapper;
	
	public boolean filledLike(int postId, Integer userId) {
		// 비로그인
		if (userId == null) {
			return false;
		}
		
		// 로그인
		return likeMapper.selectLikeCountByPostIdOrUserId(postId, userId) > 0;
	}
}
