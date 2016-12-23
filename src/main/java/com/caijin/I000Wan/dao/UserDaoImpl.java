package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;

public class UserDaoImpl extends CustomBaseSqlDaoImpl implements SystemUserDao{
	
	public List<Map> findUserList(String username,String realName,String startDate,String endDate){
		String sql =" select r.* from sysman_user r where 1=1 ";
	
		if(username != null && !"".equals(username)){
			sql+="and r.username like '%"+username+"%' ";
		}
		
		if(realName != null && !"".equals(realName)){
			sql+="and r.real_name like '%"+realName+"%' ";
		}
		
		if(startDate != null && !"".equals(startDate)){
			sql+="and r.create_date >= '"+startDate+"' ";
		}
		
		if(endDate != null && !"".equals(endDate)){
			sql+="and r.create_date <= '"+endDate+"' ";
		}
		
		sql+=" order by r.create_date desc ";
		
		return this.querySqlObjects(sql);
	}
}
