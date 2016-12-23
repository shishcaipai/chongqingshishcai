package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;
import com.caijin.I000Wan.util.PageModel;

public class MemberUserDaoImpl extends CustomBaseSqlDaoImpl implements MemberUserCustomDao{

    public  List<Map> findMemberList(String userName,String realName,String mobile,String startDate,String endDate){
		String sql="select mu.* from member_user mu where 1=1  ";
		
		if(userName != null && !userName.equals("")){
			sql+="and mu.user_name like '%"+userName+"%' ";
		}
		
		if(realName != null && !realName.equals("")){
			sql+="and mu.real_name like '%"+realName+"%' ";
		}
		
		if(mobile != null && !mobile.equals("")){
			sql+="and mu.telephone like '%"+mobile+"%' ";
		}
		
		if(startDate != null && !"".equals(startDate)){
			sql+="and mu.create_date >= '"+startDate+"' ";
		}
		
		if(endDate != null && !"".equals(endDate)){
			sql+="and mu.create_date <= '"+endDate+"' ";
		}
		
		sql+=" order by mu.update_date desc ";
		return this.querySqlObjects(sql);
	}
    
    public List<Map> getMemberUserAll(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate){
    	
    	return this.querySqlObjects(getSql(userName,realName,mobile,startDate,endDate),pageModel.getPage(),pageModel.getRows());
    }
	
    public int getMemberUserAllCount(PageModel pageModel,String userName,String realName,String mobile,String startDate,String endDate){
    	return this.getCount(getSql(userName,realName,mobile,startDate,endDate));
    }
    
    public String getSql(String userName,String realName,String mobile,String startDate,String endDate){
    	
		String sql="select mu.* from member_user mu where 1=1  ";
		
		if(userName != null && !userName.equals("")){
			sql+="and mu.user_name like '%"+userName+"%' ";
		}
		
		if(realName != null && !realName.equals("")){
			sql+="and mu.real_name like '%"+realName+"%' ";
		}
		
		if(mobile != null && !mobile.equals("")){
			sql+="and mu.telephone like '%"+mobile+"%' ";
		}
		
		if(startDate != null && !"".equals(startDate)){
			sql+="and mu.create_date >= '"+startDate+"' ";
		}
		
		if(endDate != null && !"".equals(endDate)){
			sql+="and mu.create_date <= '"+endDate+"' ";
		}
		
		sql+=" order by mu.update_date desc ";
    	
    	return sql;
    }
}
