package com.caijin.I000Wan.service;

import java.util.List;

import com.caijin.I000Wan.common.service.CommonService;
import com.caijin.I000Wan.entity.ChongZhiRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.User;

public interface ChongZhiRecordService extends CommonService<ChongZhiRecord,String>{

	/**
	 * @param n
	 * @return
	 */
	List<ChongZhiRecord> findByTopNhistory(int n);
	
	/**
	 * @param n
	 * @return
	 */
	List<ChongZhiRecord> findByTopUser(User user,int n);
	
	List<ChongZhiRecord> findByTopMenberUser(MemberUser menberuser,int n);
}
