package com.caijin.I000Wan.web.boss;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.entity.ChongZhiRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.User;
import com.caijin.I000Wan.service.ChongZhiRecordService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.UserService;
import com.caijin.I000Wan.util.Md5Util;

@Controller
@RequestMapping("/boss")
public class SysChongZhiRecordAction {

	@Autowired
	private ChongZhiRecordService chongZhiRecordService;
	@Autowired
	private MemberUserService memberUserService;
	@Autowired
	private UserService userService;

	@RequestMapping("/record/list")
	public String userList() {
		return "boss/chonzhirecordList";
	}

	@RequestMapping("/record/ajax_list")
	@ResponseBody
	public List<ChongZhiRecord> findUserList(HttpServletRequest request) {
		String userName = request.getParameter("userName");
		String sysUser = request.getParameter("sysUser");
		MemberUser memberUser = memberUserService.findByUserName(userName);
		User user = userService.findUserByName(sysUser);
		List<ChongZhiRecord> userList;
		if (memberUser == null && user == null) {
			userList = chongZhiRecordService.findByTopNhistory(1000);
		} else if (memberUser != null && user == null) {
			userList = chongZhiRecordService.findByTopMenberUser(memberUser,
					1000);
		} else if (memberUser == null && user != null) {
			userList = chongZhiRecordService.findByTopUser(user, 1000);
		} else {
			userList = chongZhiRecordService.findByTopMenberUserAndUser(
					memberUser, user, 1000);
		}
		return userList;
	}

	@RequestMapping("/record/deleteAll")
	public void deleteAll(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String msg = "";
		User sysUser = (User) request.getSession().getAttribute("sysUSer");
		if (sysUser != null) {
			chongZhiRecordService.deleteAll();
			msg="删除成功";
		} else {
			msg = "用户登陆失效";
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
