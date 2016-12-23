package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

public interface OrderCustomDao {

	List<Map> findOrderListByCondition(String userName,String realName,String telephone,
			String orderType,String orderStatus,String payStatus,
			String startDate,String endDate);
}
