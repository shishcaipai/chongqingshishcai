package com.caijin.I000Wan.web.boss;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.util.DataGridModel;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;

@Controller
@RequestMapping("/boss")
public class OrderAction {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping("/order/list")
	public String orderList(){
		
		return "boss/order/list";
	}
	
	@RequestMapping("/order/ajax_list")
	@ResponseBody
	public List<Map> findOrderList(HttpServletRequest request){
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String telephone = request.getParameter("telephone");
		String orderType = request.getParameter("orderType");
		String orderStatus = request.getParameter("orderStatus");
		String payStatus = request.getParameter("payStatus");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		List<Map> orderList=orderService.findOrderListByCondition(userName,realName,telephone,
				orderType,orderStatus,payStatus,startDate,endDate);
	
	    return orderList;
	}
	
	/*@RequestMapping(value = "/order/ajax_list_page", method = RequestMethod.POST,
			produces = { "application/json;charset=utf-8" })
	@ResponseBody
	public Result<Map> findOrderList2(DataGridModel dgm,HttpServletRequest request,PageModel pageModel){
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String telephone = request.getParameter("telephone");
		String orderType = request.getParameter("orderType");
		String orderStatus = request.getParameter("orderStatus");
		String payStatus = request.getParameter("payStatus");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		pageModel = new PageModel(dgm.getPage(), dgm.getRows(), null);
		Result<Map> result = null;
		result = orderService.getOrderAll(
					pageModel,userName, realName, mobile, startDate, endDate);
		return result;
	}*/
}
