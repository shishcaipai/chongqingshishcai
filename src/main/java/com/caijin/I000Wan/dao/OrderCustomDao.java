package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

public interface OrderCustomDao {
     public void  clear();
	List<Map> findOrderListByCondition(String userName,String realName,String telephone,
			String orderType,String orderStatus,String payStatus,
			String startDate,String endDate);
	Result findOrderListByCondition(PageModel model,String userName,String realName,String telephone,
			String orderType,String orderStatus,String payStatus,
			String startDate,String endDate);
	List<Map> findUserTotalAmountList(String startDate);
}
