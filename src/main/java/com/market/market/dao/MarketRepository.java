package com.market.market.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.market.post.entity.PostEntity;

@Repository
public interface MarketRepository extends JpaRepository<PostEntity, Integer>{

	Page<PostEntity> findAll(Pageable pageable);
}
