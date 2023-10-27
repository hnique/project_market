package com.market.market.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.market.dao.MarketRepository;

@Service
public class MarketBO {

	@Autowired
	private MarketRepository marketRepository;
}
