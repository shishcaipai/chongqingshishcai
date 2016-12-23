package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.ApplyRecord;
/**
 * 申请记录数据访问层
 * @author Jeff
 *
 */
public interface ApplyRecordDao  extends ApplyRecordCustomDao,CommonDao<ApplyRecord,String>{

	/**
	 * 取某个人最近一周的的提款记录信息
	 * @param userId
	 * @return
	 */
	@Query("select r from ApplyRecord r where r.memberUser.id= ?1 ")
	public List<ApplyRecord> getRecentOneWeekApplyRecordList(String userId);
	
	/**
	 * 取某个人某段时间内的提款记录信息
	 * @param userId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@Query("select r from ApplyRecord r where r.memberUser.id= ?1 and r.createDate >= ?2 and r.createDate<= ?3 ")
	public List<ApplyRecord> getApplyRecordList(String userId,String startDate,String endDate);
	
}
