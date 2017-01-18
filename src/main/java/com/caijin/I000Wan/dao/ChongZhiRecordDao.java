package com.caijin.I000Wan.dao;

import java.util.List;
import java.util.Map;

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

	@Query(value="select p.* from chongzhi_record p  order by p.create_date desc limit 0,?1 ",nativeQuery=true)
	List<ChongZhiRecord> findByTopNhistory(int n);
	@Query(value="select p.* from chongzhi_record p where p.user_id=?1 order by p.create_date desc limit 0,?2 ",nativeQuery=true)
	List<ChongZhiRecord> findByTopUser(String userId, int n);
	@Query(value="select p.* from chongzhi_record p where p.member_id=?1 order by p.create_date desc limit 0,?2 ",nativeQuery=true)
	List<ChongZhiRecord> findByTopMenberUser(String memberid, int n);
	
	@Query(value="select p.* from chongzhi_record p where p.member_id=?1 and p.user_id=?2 order by p.create_date desc limit 0,?3 ",nativeQuery=true)
	List<ChongZhiRecord> findByTopMenberUserOrUser(String memberid,String userid, int n);
  
}
