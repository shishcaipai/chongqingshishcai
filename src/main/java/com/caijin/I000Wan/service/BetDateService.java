package com.caijin.I000Wan.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.entity.BetDate;

@Component
@Transactional
public interface BetDateService {

	List<BetDate> findCurrentBetDate();
}
