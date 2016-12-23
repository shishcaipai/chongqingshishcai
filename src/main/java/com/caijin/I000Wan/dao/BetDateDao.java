package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.entity.BetDate;

public interface BetDateDao extends JpaRepository<BetDate, String>{

	@Query("  select c1 from BetDate c1 where c1.status=?1 ")
	List<BetDate> findCurrentBetDate(Integer status);
}
