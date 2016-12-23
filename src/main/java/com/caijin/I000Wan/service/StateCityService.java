package com.caijin.I000Wan.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.entity.StateCity;

@Component
@Transactional
public interface StateCityService {

	List<StateCity> findProvince();
	
	List<StateCity> findCityByProvinceName(String provinceName);
}
