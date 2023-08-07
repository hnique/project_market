package com.market.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.user.dao.UserRepository;
import com.market.user.entity.UserEntity;

@Service
public class UserBO {
	@Autowired
	private UserRepository userRepository;

	public UserEntity getUserEntityByLoginId(String loginId) {
		return userRepository.findByLoginId(loginId);
	}
	
	public Integer addUser(String loginId, String password, String name, 
			String phoneNumber, String email) {
		UserEntity userEntity = userRepository.save(
					UserEntity.builder()
					.loginId(loginId)
					.password(password)
					.name(name)
					.phoneNumber(phoneNumber)
					.email(email)
					.build()
				);
		return userEntity == null ? null : userEntity.getId();
	}
}
