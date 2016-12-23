package com.caijin.I000Wan.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.FootballMatch;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.StateCity;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.StateCityService;
import com.caijin.I000Wan.util.EmailUtils;
import com.caijin.I000Wan.util.GenerateLinkUtils;
import com.caijin.I000Wan.util.Md5Util;
import com.caijin.I000Wan.util.RandomValidateCode;

/**
 * 用户Action
 * @author jeff
 * @since 2014-07-14
 */
@Controller
public class UserController {

	@Autowired
	private MemberUserService userService;
	@Autowired
	private StateCityService stateCityService;
	
	/**
	 * 注册
	 * @return
	 */
	@RequestMapping("/user/register")
	public String register(){
		
		return "user/register";
	}
	
	/**
	 * 注册提交
	 * @return
	 */
	@RequestMapping(value = "/user/doregister",method = RequestMethod.POST)
	public String doRegister(Model model,HttpServletRequest req){
		String userName=req.getParameter("userName");
		String pwd=req.getParameter("pwd");
		String randomCode=req.getParameter("randomCode");
		String resultMsg="";//返回提示语
		
		MemberUser member = userService.findByUserName(userName);// 得到要激活的帐户
		if(member!=null){
			resultMsg = "用户名已存在、您可以使用其他邮箱注册";
			model.addAttribute("resultMsg", resultMsg);
			return "user/register";
		}
		
		String realRandomCode=(String)req.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY);
		//保存加密后的密码
		pwd=Md5Util.generatePassword(pwd);
		
		if(randomCode.toUpperCase().equals(realRandomCode.toUpperCase())){
			MemberUser mu=new MemberUser();
			mu.setUserName(userName);
			mu.setCreateDate(new Date());
			mu.setUpdateDate(new Date());
			mu.setPwd(pwd);
			mu.setTotalScore(0);
			mu.setAvailableScore(0);
			
			userService.save(mu);
			req.getSession().setAttribute("memberUser", mu);
			return "redirect:/user/registersucess";
		}else{
			return "redirect:/user/register";
		}
		
	}
	
	/**
	 * 跳转到注册成功页面
	 * @return
	 */
	@RequestMapping("/user/registersucess")
	public String registerSucess(){
		
		return "user/registerSucess";
	}
	
	/**
	 * 跳到登录
	 * @return
	 */
	@RequestMapping("/user/login")
	public String login(){
		
		return "user/login";
	}
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping(value = "/user/dologin",method = RequestMethod.POST)
	public String doLogin(Model model,HttpServletRequest req){
		boolean result=false;
		String resultMsg="";//返回提示语
		MemberUser mu=null;
		
		String userName=req.getParameter("userName");
		String pwd=req.getParameter("pwd");
		String randomCode=req.getParameter("randomCode");
		
		String realRandomCode=(String)req.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY);
		
		if(randomCode.toUpperCase().equals(realRandomCode.toUpperCase())){
			mu=userService.findByUserName(userName);
			if(mu != null){
				if(Md5Util.validatePassword(mu.getPwd(), pwd)){
					mu.setRandomCode(realRandomCode);
					result=true;
				}else{
					resultMsg="密码错误!";
				}
			}else{
				resultMsg="不存在该用户!";
			}
		}else{
			resultMsg="你输入的验证码不正确!";
		}
		if(result){
			req.getSession().setAttribute("memberUser", mu);
			return "redirect:/user/memberCenter";
		}else{
		  model.addAttribute("result", result);
		  model.addAttribute("resultMsg", resultMsg);
		  return "user/login"; 
		}
	}
	
	/**
	 * 登出
	 * @return
	 */
	@RequestMapping("/user/loginout")
	public String loginOut(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		if(session != null){
			session.removeAttribute("memberUser");
		}
		return "redirect:/user/login";
	}
	
	/**
	 * 跳转到用户中心
	 * @return
	 */
	@RequestMapping("/user/memberCenter")
	public String memberCenter(HttpServletRequest request){
		MemberUser user = (MemberUser)request.getSession().getAttribute("memberUser");
		Map model = new HashMap();  
		model.put("memberUser", user);
		return "user/memberCenter";
	}
	
	/**
	 * 账号激活
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/activateAccount")
	public ModelAndView activateAccount(HttpServletRequest request, HttpServletResponse response){
		String userName = request.getParameter("userName");  
        MemberUser member = userService.findByUserName(userName);// 得到要激活的帐户  
        // 校验验证码是否和注册时发送的一致，以此设置是否激活该帐户  
        member.setActivated(GenerateLinkUtils.verifyCheckcode(member, request));
        userService.save(member);  
        
        sessionReload(request,member);  
        Map model = new HashMap();  
		model.put("memberUser", member);
		return new ModelAndView("user/securityCenter",model);
	} 
	
	
	/**
	 * 个人中心
	 * @return
	 */
	@RequestMapping("/user/personInfo")
	public ModelAndView userCenter(HttpServletRequest request){
		MemberUser user = (MemberUser)request.getSession().getAttribute("memberUser");
		if(user==null){
			return new ModelAndView("redirect:/user/login");
		}
		
		List<StateCity> provinceList = stateCityService.findProvince();
		//封装ModelAndView
		Map model = new HashMap();  
		model.put("memberUser", user);
		model.put("provinceList", provinceList);
		return new ModelAndView("user/personInfo",model);
	}
	
	/**
	 * 个人信息提交
	 * @return
	 */
    @RequestMapping(value="/user/savePersonInfo",
    		method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveMemberUser(MemberUser memberUser,
    		HttpServletRequest request,HttpServletResponse response){
  	    String message="保存操作出错";
  	    MemberUser member = userService.findByUserName(memberUser.getUserName());
    	try{
    		member.setTelephone(memberUser.getTelephone());
    		member.setSex(memberUser.getSex());
    		member.setBirthday(memberUser.getBirthday());
    		member.setState(memberUser.getState());
    		member.setCity(memberUser.getCity());
    		member.setAddress(memberUser.getAddress());
    		member.setUpdateDate(new Date());//最后修改人
        	userService.save(member);
        	sessionReload(request,member);
        	message="保存成功";
    	}catch(Exception e){
    		message="保存操作出错:"+e.getMessage();
    	}
    	return message;
    }
    
	/**
	 * 真实姓名、身份证号码提交
	 * @return
	 */
    @RequestMapping(value="/user/saveRealNameInfo",
    		method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveRealNameInfo(MemberUser memberUser,
    		HttpServletRequest request,HttpServletResponse response){
  	    String message="保存操作出错";
  	    MemberUser member = userService.findByUserName(memberUser.getUserName());
    	try{
    		member.setRealName(memberUser.getRealName());
    		member.setIdentityCard(memberUser.getIdentityCard());
    		member.setUpdateDate(new Date());//最后修改人
        	userService.save(member);
        	sessionReload(request,member);
        	message="保存成功";
    	}catch(Exception e){
    		message="保存操作出错:"+e.getMessage();
    	}
    	return message;
    }
    
	/**
	 * 支付宝账号提交
	 * @return
	 */
    @RequestMapping(value="/user/saveBankInfo",
    		method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String saveBankInfo(MemberUser memberUser,
    		HttpServletRequest request,HttpServletResponse response){
  	    String message="支付宝账号保存出错";
  	    MemberUser member = userService.findByUserName(memberUser.getUserName());
	  	try{
	  		if(!Md5Util.validatePassword(member.getPwd(), memberUser.getPwd())){
	  			message="网站登录密码不正确，请重新输入";
	  		}else{
	  			member.setBankCode(memberUser.getBankCode());
	  			member.setUpdateDate(new Date());//最后修改人
	          	userService.save(member);
	          	sessionReload(request,member);
	          	message="支付宝账号保存成功";
	  		}
	  	}catch(Exception e){
	  		message="支付宝账号保存出错:"+e.getMessage();
	  	}
	  	return message;
	}
	
	/**
	 * 跳转邮箱绑定
	 * @return
	 */
	@RequestMapping("/user/emailInfo")
	public String emialInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session==null){
			return "redirect:/user/login";
		}
		
		MemberUser user = (MemberUser)session.getAttribute("memberUser");
		Map model = new HashMap();  
		model.put("memberUser", user);
		return "user/emailInfo";
	}
	
	/**
	 * 跳转银行卡绑定页面
	 * @return
	 */
	@RequestMapping("/user/bankInfo")
	public String bankInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session==null){
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser)session.getAttribute("memberUser");
		//取保存后的新数据
		Map model = new HashMap();  
		model.put("memberUser", member);
		return "user/bankInfo";
	}
	
	/**
	 * 跳转实名认证
	 * @return
	 */
	@RequestMapping("/user/realNameInfo")
	public String realNameInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session==null){
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser)session.getAttribute("memberUser");
		//取保存后的新数据
		Map model = new HashMap();  
		model.put("memberUser", member);
		return "user/realNameInfo";
	}
	
	/**
	 * 跳转修改密码页面
	 * @return
	 */
	@RequestMapping("/user/resetPasswordInfo")
	public String resetPasswordInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session==null){
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser)session.getAttribute("memberUser");
		//取保存后的新数据
		Map model = new HashMap();  
		model.put("memberUser", member);
		return "user/resetPasswordInfo";
	}
	
	/**
	 * 跳转安全中心页面
	 * @return
	 */
	@RequestMapping("/user/securityCenter")
	public String securityCenter(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session==null){
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser)session.getAttribute("memberUser");
		//取保存后的新数据
		Map model = new HashMap();  
		model.put("memberUser", member);
		return "user/securityCenter";
	}
	
	/**
	 * 跳转手机号绑定页面
	 * @return
	 */
	@RequestMapping("/user/telephoneInfo")
	public String telephoneInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session==null){
			return "redirect:/user/login";
		}
		MemberUser member = (MemberUser)session.getAttribute("memberUser");
		//取保存后的新数据
		Map model = new HashMap();  
		model.put("memberUser", member);
		return "user/telephoneInfo";
	}
	
	/**
	 * 重置密码提交
	 * @return
	 */
    @RequestMapping(value="/user/resetPassword",
    		method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String resetPassword(MemberUser memberUser,
    		HttpServletRequest request,HttpServletResponse response){
    	MemberUser user = (MemberUser)request.getSession().getAttribute("memberUser");
    	String password=request.getParameter("password");
  	    String message="重置密码出错";
    	try{
    		if(!Md5Util.validatePassword(user.getPwd(), password)){
    			message="当前密码不正确，请重新输入";
    		}else{
    			String resetPassword=request.getParameter("resetPassword");
    			user.setPwd(Md5Util.generatePassword(resetPassword));
    			user.setUpdateDate(new Date());//最后修改人
            	userService.save(user);
            	sessionReload(request,user);
            	message="重置密码成功";
    		}
    	}catch(Exception e){
    		message="重置密码出错:"+e.getMessage();
    	}
    	return message;
    }
    
	/**
	 * 绑定手机号码
	 * @return
	 */
	@RequestMapping(value="/user/telephoneSave",
			method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String telephoneSave(HttpServletRequest request){
		String telephone=request.getParameter("telephone");
		String userName=request.getParameter("userName");
		String message="保存手机号出错";
    	try{
    		MemberUser member = userService.findByUserName(userName);
    		member.setTelephone(telephone);
    		member.setUpdateDate(new Date());//最后修改时间
        	userService.save(member);
        	sessionReload(request,member);
        	message="保存手机号成功";
    	}catch(Exception e){
    		message="保存手机号出错:"+e.getMessage();
    	}
    	
    	return message;
	}
	
	/**
	 * 发送验证邮件
	 * @return
	 */
    @RequestMapping(value="/user/validateEmail",
    		method=RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String validateEmail(HttpServletRequest request,HttpServletResponse response){
    	MemberUser user = (MemberUser)request.getSession().getAttribute("memberUser");
  	    String message="发送验证邮件出错";
    	try{
     		EmailUtils.sendAccountActivateEmail(user);
        	message="发送验证邮件成功";
    	}catch(Exception e){
    		message="发送验证邮件出错:"+e.getMessage();
    	}
    	return message;
    }
    
    private void sessionReload(HttpServletRequest request,MemberUser memberUser){
    	request.getSession().removeAttribute("memberUser");
    	request.getSession().setAttribute("memberUser",memberUser);
    }
    
	/**
	 * 取对应省份的城市
	 * @param lotteryCode
	 * @param period
	 * @return
	 */
	@RequestMapping(value = "/user/getCityList",method=RequestMethod.POST,
			produces = {"application/json;charset=UTF-8"})
	public @ResponseBody List<StateCity> getCityList(String provinceName){
		List<StateCity> cityList = stateCityService.findCityByProvinceName(provinceName);
		return cityList;
	}
}
