package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caijin.I000Wan.dao.BetDateDao;
import com.caijin.I000Wan.entity.BetDate;
import com.caijin.I000Wan.service.BetDateService;

@Service
public class BetDateServiceImpl implements BetDateService {

	@Autowired
	private BetDateDao betDateDao;
	
	@Override
	public List<BetDate> findCurrentBetDate() {
		return betDateDao.findCurrentBetDate(1);
	}

}
