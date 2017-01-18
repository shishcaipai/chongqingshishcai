package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

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
		return chongZhiRecordDao.findByTopUser(user.getId(),n);
	}

	@Override
	public List<ChongZhiRecord> findByTopMenberUser(MemberUser menberuser, int n) {
		return chongZhiRecordDao.findByTopMenberUser(menberuser.getId(),n);
	}
	@Override
	public List<ChongZhiRecord> findByTopMenberUserAndUser(MemberUser menberuser,User user, int n) {
		return chongZhiRecordDao.findByTopMenberUserOrUser(menberuser.getId(), user.getId(), n);
	}
	@Override
	public void deleteAll() {
		 chongZhiRecordDao.deleteAll();;
	}
	@Override
	public void delete(ChongZhiRecord  record) {
		 chongZhiRecordDao.delete(record);
	}
}
