package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.HeMaiOrder;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;

public interface HeMaiOrderDao extends CommonDao<HeMaiOrder, String> {
	@Query("select o from HeMaiOrder o where o.orderDetail = ?1 ")
	List<HeMaiOrder> findOrderHemaiByOrderId(HeMaiOrderDetail order);

	@Query("select o from HeMaiOrder o")
	List<HeMaiOrder> findAllHemaiOrders();
	@Query(value="select sum(u.subGuaranteeSum) from HeMaiOrder u where u.orderDetail=?1 ")
	Integer getHemaiOrderFenNum(HeMaiOrderDetail order);
	@Query(value = "select o.* from hemai_order o  where  o.member_id = ?3 order by o.create_date desc limit ?1,?2 ", nativeQuery = true)
	List<HeMaiOrder> findAllOrderZuiHao(int i, int pageSize, String id);
	@Query(value = "select count(o.id) from hemai_order o  where  o.member_id = ?1 ", nativeQuery = true)
	Integer findOrderZuiHaoSize(String id);
}
