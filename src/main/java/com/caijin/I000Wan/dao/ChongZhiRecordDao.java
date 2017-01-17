package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.ChongZhiRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Period;
import com.caijin.I000Wan.entity.User;

/**
 * 充值记录Dao
 * @author ji
 */
public interface ChongZhiRecordDao extends CommonDao<ChongZhiRecord,String>{

	@Query(value="select p.* from ChongZhiRecord p  order by p.createDate desc limit 0,?1 ",nativeQuery=true)
	List<ChongZhiRecord> findByTopNhistory(int n);
	@Query(value="select p.* from ChongZhiRecord p where p.user=?1 order by p.createDate desc limit 0,?2 ",nativeQuery=true)
	List<ChongZhiRecord> findByTopUser(User user, int n);
	@Query(value="select p.* from ChongZhiRecord p where p.memberUser=?1 order by p.createDate desc limit 0,?2 ",nativeQuery=true)
	List<ChongZhiRecord> findByTopMenberUser(MemberUser menberuser, int n);

}
