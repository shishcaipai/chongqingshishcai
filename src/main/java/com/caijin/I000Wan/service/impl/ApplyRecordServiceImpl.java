package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.ApplyRecordDao;
import com.caijin.I000Wan.entity.ApplyRecord;
import com.caijin.I000Wan.service.ApplyRecordService;

@Component
@Transactional
public class ApplyRecordServiceImpl extends CommonServiceImpl<ApplyRecord,String> implements ApplyRecordService{

	@Autowired
	private ApplyRecordDao applyRecordDao;

	@Autowired
	public void setApplyRecordDao(ApplyRecordDao applyRecordDao) {
		super.setCommonDao(applyRecordDao);
	}
	
	/**
	 * 取某个人最近一周的的提款记录信息
	 * @param userId
	 * @return
	 */
	public List<ApplyRecord> getRecentOneWeekApplyRecordList(String userId){
		return applyRecordDao.getRecentOneWeekApplyRecordList(userId);
	}
	
	/**
	 * 取某个人某段时间内的提款记录信息
	 * @param userId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<ApplyRecord> getApplyRecordList(String userId,String startDate,String endDate){
		return applyRecordDao.getApplyRecordList(userId, startDate, endDate);
	}
	
	public List<Map> findApplyRecordListByCondition(String realName,String idCardNo,
			String userName,String auditStatus,
			String applystartDate,String applyendDate,String startDate,String endDate){
		return applyRecordDao.findApplyRecordListByCondition(realName,idCardNo,
				userName,auditStatus,applystartDate,applyendDate,startDate,endDate);
	}
	
}
