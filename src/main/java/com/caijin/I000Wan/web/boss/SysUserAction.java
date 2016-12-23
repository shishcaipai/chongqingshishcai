package com.caijin.I000Wan.web.boss;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caijin.I000Wan.entity.User;
import com.caijin.I000Wan.service.UserService;
import com.caijin.I000Wan.util.Md5Util;

@Controller
@RequestMapping("/boss")
public class SysUserAction {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/sysuser/list")
	public String userList(){
		
		return "boss/system/user";
	}
	
	@RequestMapping("/sysuser/ajax_list")
	@ResponseBody
	public List<Map> findUserList(HttpServletRequest request){
		String userName = request.getParameter("userName");
		String realName = request.getParameter("realName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		List<Map> userList =
				userService.findUserList(userName,realName,startDate,endDate);
		return userList;
	}
	
	@RequestMapping("/sysuser/ajax_save")
	@ResponseBody
	public Map saveUser(HttpServletRequest request) throws IOException{
		Map result = new HashMap();
		result.put("sucess", false);
		
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String realName = request.getParameter("realName");
		password=Md5Util.generatePassword(password);
		
		try{
			User user = new User();
			user.setUsername(userName);
			user.setPassword(password);
			user.setRealName(realName);
			user.setCreateDate(new Date());
			user.setUpdateDate(new Date());
			
			userService.save(user);
			result.put("sucess", true);
		}catch(Exception e){
			e.printStackTrace();
		}

		return result;
	}
	
	@RequestMapping("/sysuser/ajax_delete")
	@ResponseBody
	public Map deleteUser(HttpServletRequest request){
		Map result = new HashMap();
		result.put("sucess", false);
		
		String id = request.getParameter("id");
		
		if(id != null && !id.equals("")){
			userService.delete(id);
			result.put("sucess", true);
		}
		
		return result;
		
	}
	
}
