package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.entity.StateCity;

public interface StateCityDao extends JpaRepository<StateCity, String>{

	@Query("select p from StateCity p where p.classType=1 ")
	List<StateCity> findProvince();
	
	@Query("  select c1 from StateCity c1 where c1.classParentName=?1 ")
	List<StateCity> findCityByProvinceName(String provinceName);
}
