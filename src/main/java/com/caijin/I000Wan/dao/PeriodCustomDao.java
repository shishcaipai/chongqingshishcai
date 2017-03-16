package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface PeriodCustomDao {

	int updatePeriodStatusByOId(String orderNo, int status, String lotteryCode);

	public int updatePeriodStatusByOIdAndParse(String orderNo, int status,
			String lotteryCode, String parse);

	public void clear();
}
