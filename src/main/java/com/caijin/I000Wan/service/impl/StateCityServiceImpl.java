package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.dao.StateCityDao;
import com.caijin.I000Wan.entity.StateCity;
import com.caijin.I000Wan.service.StateCityService;

@Component
@Transactional
public class StateCityServiceImpl implements StateCityService {

	@Autowired
	private StateCityDao stateCityDao;
	
	@Override
	public List<StateCity> findProvince() {
		return stateCityDao.findProvince();
	}

	@Override
	public List<StateCity> findCityByProvinceName(String provinceName) {
		return stateCityDao.findCityByProvinceName(provinceName);
	}

}
