package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

import com.caijin.I000Wan.common.dao.CustomBaseSqlDaoImpl;

public class ApplyRecordDaoImpl extends CustomBaseSqlDaoImpl implements ApplyRecordCustomDao{

	
	public List<Map> findApplyRecordListByCondition(String realName,String idCardNo,
			String userName,String auditStatus,
			String applystartDate,String applyendDate,String startDate,String endDate){
		
		String sql =" select u.user_name,r.apply_name,r.id_card_no,r.apply_money," +
					" r.create_date,r.bank_name,r.audit_status,r.auditor,r.audit_time" +
					" from apply_record r" +
					" inner join member_user u on u.id=r.member_id where 1=1 ";
		
		if(realName != null && !"".equals(realName)){
			sql+="and r.apply_name like '%"+realName+"%' ";
		}
		
		if(idCardNo != null && !"".equals(idCardNo)){
			sql+="and r.id_card_no like '%"+idCardNo+"%' ";
		}
		if(userName != null && !"".equals(userName)){
			sql+="and u.user_name like '%"+userName+"%' ";
		}
		
		if(auditStatus != null&&!"".equals(auditStatus)){
			sql+="and r.audit_status = "+auditStatus+" ";
		}
		
		if(applystartDate != null && !"".equals(applystartDate)){
			sql+="and r.create_date >= '"+applystartDate+"' ";
		}
		
		if(applyendDate != null && !"".equals(applyendDate)){
			sql+="and r.create_date <= '"+applyendDate+"' ";
		}
		
		if(startDate != null && !"".equals(startDate)){
			sql+="and r.audit_time >= '"+startDate+"' ";
		}
		
		if(endDate != null && !"".equals(endDate)){
			sql+="and r.audit_time <= '"+endDate+"' ";
		}
		
		sql+=" order by r.create_date desc ";
		return this.querySqlObjects(sql);
	}
}
