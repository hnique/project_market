package com.market.user.bo;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.market.common.StringUtils;
import com.market.user.dao.UserRepository;
import com.market.user.entity.UserEntity;

@Service
public class UserBO {
	@Autowired
	private UserRepository userRepository;

	public UserEntity getUserEntityByLoginId(String loginId) {
		return userRepository.findByLoginId(loginId);
	}
	
	public UserEntity getUserEntityByLoginIdAndPassword(String loginId, String password) {
		return userRepository.findByLoginIdAndPassword(loginId, password);
	}
	
	public UserEntity getUserList(int userId) {
		return userRepository.findAllById(userId);
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
	
	@Transactional
	public void updateUserInfo(int userId, String password, String phoneNumber, String email) {
		Optional<UserEntity> userEntity = userRepository.findById(userId);
		
		UserEntity user = userEntity.get();
		if (StringUtils.isNotBlank(password)) {
			user = user.toBuilder().password(password).build();
		}
		if (StringUtils.isNotBlank(phoneNumber)) {
			user = user.toBuilder().phoneNumber(phoneNumber).build();
		}
		if (StringUtils.isNotBlank(email)) {
			user = user.toBuilder().email(email).build();
		}
		
		userRepository.save(user);
	}
}
