package com.market.user.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.market.user.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer>{

	public UserEntity findByLoginId(String loginId);
}
