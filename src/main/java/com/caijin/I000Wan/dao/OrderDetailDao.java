package com.caijin.I000Wan.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.caijin.I000Wan.common.dao.CommonDao;
import com.caijin.I000Wan.entity.HeMaiOrderDetail;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
/**
 * 订单详情数据访问层
 * @author Jeff
 *
 */
public interface OrderDetailDao extends CommonDao<OrderDetail,String>{
	@Query("select o from OrderDetail o where o.order = ?1 ")
	List<OrderDetail> findOrderDetailByOrderId(Order order);
	
	@Query(value="select o.* from order_detail o left join trade_order t on o.order_on = t.id where t.member_id = ?3 limit ?1,?2 ",nativeQuery=true)
	List<OrderDetail> findAllOrderDetails(Integer pageNum, int size, String id);
	
	@Query(value="select count(*) from order_detail o left join trade_order t on o.order_no = t.id where t.member_id = ?1",nativeQuery=true)
	int findOrderDetailsSize(String id);
	@Query(value="select o.* from order_detail o  left join lottery_period t on o.order_no = t.orderid  left join trade_order od  on od.order_no=o.order_no  where t.lottery_period = ?1 and t.status=1 and od.order_status=1 ",nativeQuery=true)
	List<OrderDetail> findbyQIhao(String expect);
	@Query(value="select o.* from order_detail o where o.order_no = ?1",nativeQuery=true)
	List<OrderDetail> findOrderDetailByOrderId(String orderNo);

}
