package com.caijin.I000Wan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.ChongZhiRecordDao;
import com.caijin.I000Wan.entity.ChongZhiRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.User;
import com.caijin.I000Wan.service.ChongZhiRecordService;

@Component
@Transactional
public class ChongZhiRecordServiceImpl extends CommonServiceImpl<ChongZhiRecord,String>  implements ChongZhiRecordService{
	
	@Autowired
	private ChongZhiRecordDao chongZhiRecordDao;
	@Autowired
	public void setChongZhiRecordDao(ChongZhiRecordDao chongZhiRecordDao) {
		super.setCommonDao(chongZhiRecordDao);
	}
	


	@Override
	public List<ChongZhiRecord> findByTopNhistory(int n) {
		return chongZhiRecordDao.findByTopNhistory(n);
	}

	@Override
	public List<ChongZhiRecord> findByTopUser(User user, int n) {
		// TODO Auto-generated method stub
		return chongZhiRecordDao.findByTopUser(user,n);
	}

	@Override
	public List<ChongZhiRecord> findByTopMenberUser(MemberUser menberuser, int n) {
		// TODO Auto-generated method stub
		return chongZhiRecordDao.findByTopMenberUser(menberuser,n);
	}
}
