package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

public interface SystemUserDao {

	List<Map> findUserList(String username,String realName,String startDate,String endDate);
}
