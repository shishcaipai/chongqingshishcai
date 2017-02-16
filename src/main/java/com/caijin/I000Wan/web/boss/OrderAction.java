package com.caijin.I000Wan.web.boss;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Order;
import com.caijin.I000Wan.entity.OrderDetail;
import com.caijin.I000Wan.service.OrderDetailService;
import com.caijin.I000Wan.service.OrderService;
import com.caijin.I000Wan.util.DataGridModel;
import com.caijin.I000Wan.util.Mum;
import com.caijin.I000Wan.util.PageModel;
import com.caijin.I000Wan.util.Result;
import com.caijin.I000Wan.web.OrderController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/boss")
public class OrderAction {
	private final Logger log = LoggerFactory.getLogger(OrderAction.class);
	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderDetailService orderDetailService;

	@RequestMapping("/order/list")
	public String orderList() {

		return "boss/order/list";
	}

	@RequestMapping("/order/ajax_list")
	@ResponseBody
	public List<Map> findOrderList(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String telephone = request.getParameter("telephone");
		String orderType = request.getParameter("orderType");
		String orderStatus = request.getParameter("orderStatus");
		String payStatus = request.getParameter("payStatus");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		List<Map> orderList = orderService.findOrderListByCondition(userName,
				realName, telephone, orderType, orderStatus, payStatus,
				startDate, endDate);
		// StringBuffer buffer;
		// for (Map map : orderList) {
		// try {
		// List<OrderDetail> details = orderDetailService
		// .findOrderDetailByOrderId((String) map.get("order_no"));
		//
		// buffer = new StringBuffer();
		// for (OrderDetail detail : details) {
		// if (buffer.length() > 0) {
		// buffer.append("\\$");
		// }
		// buffer.append(detail.getBuyCaiNumber());
		//
		// }
		// map.put("details", buffer.toString());
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// }

		return orderList;
	}

	@RequestMapping("/order/order_detail")
	public void getOrderDetail(HttpServletRequest request,
			HttpServletResponse response) {
		String orderNo = request.getParameter("orderNo");
		log.info("=============" + orderNo);
		List<OrderDetail> details = new ArrayList<OrderDetail>();
		ObjectMapper mapper = new ObjectMapper(); // 转换器
		try {
			details = orderDetailService.findOrderDetailByOrderId(orderNo);
		} catch (Exception e) {
			e.printStackTrace();
			details = new ArrayList<OrderDetail>();
		}
		log.info("=============" + details.size());
		String json = "";
		try {
			json = mapper.writeValueAsString(details);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 将对
		try {
			renderText(response, json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 新增
	 * 
	 * @param memberUser
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/order/updateNum", method = RequestMethod.POST)
	public void updateOderDetailNum(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String json = request.getParameter("orders");
		String orderNo = request.getParameter("orderNo");
		String status = request.getParameter("wprizeStatus");
		int wprizeStatus = Integer.valueOf(status);
		log.info("----------" + json);
		String msg = "";
		int i = 0;
		int length = 0;
		try {
			if (json != null && !json.equals("")) {
				ObjectMapper mapper = new ObjectMapper();
				List<Mum> lendReco = mapper.readValue(json,
						new TypeReference<List<Mum>>() {
						});
				length = lendReco.size();
				for (Mum mum : lendReco) {
					OrderDetail detail = orderDetailService.find(mum.getId());
					detail.setBuyCaiNumber(mum.getNum());
					orderDetailService.update(detail);
					i++;
				}
			}
			if (length == i) {
				msg = "修改成功";
			} else if (i == 0) {
				msg = "修改失败";
			} else if (i < length) {
				msg = "修改部分成功";
			}
			Order order = orderService.findOrderByOrderId(orderNo);
			order.setWprizeStatus(wprizeStatus);
			orderService.update(order);
			log.info(i + "----------" + length);
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改失败";
		}
		renderText(response, msg);
	}

	private void renderText(HttpServletResponse response, Object result)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		out.print(result);
		out.flush();
		out.close();
	}

}
