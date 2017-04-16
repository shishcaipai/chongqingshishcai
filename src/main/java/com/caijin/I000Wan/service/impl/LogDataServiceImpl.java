package com.caijin.I000Wan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.caijin.I000Wan.common.service.impl.CommonServiceImpl;
import com.caijin.I000Wan.dao.LogDataDao;
import com.caijin.I000Wan.dao.MenuDao;
import com.caijin.I000Wan.entity.LogData;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.service.LogDataService;
import com.caijin.I000Wan.service.MenuService;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;
@Component
@Transactional
public class LogDataServiceImpl extends CommonServiceImpl<LogData,String> implements LogDataService {
	@Autowired
	private LogDataDao logDataDao;
	@Autowired
	public void setLogDataDao(LogDataDao logDataDao) {
		super.setCommonDao(logDataDao);
	}
	@Override
	public List<LogData> findAll() {
		return logDataDao.findAll();
	}
	@Override
	public List<LogData> findByUserId(MemberUser userId) {
		return logDataDao.findByUserId(userId);
	}
	@Override
	public Result<Map> getLogDataMemberUserAll(PageModel pageModel,
			String userName, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return logDataDao.findApplyRecordListByCondition(pageModel, userName, startDate, endDate);
	}

}
