package com.caijin.I000Wan.web.boss;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.entity.RoleMenu;
import com.caijin.I000Wan.entity.User;
import com.caijin.I000Wan.service.MenuService;
import com.caijin.I000Wan.service.RoleMenuService;
import com.caijin.I000Wan.service.RoleService;
import com.caijin.I000Wan.service.UserService;
import com.caijin.I000Wan.util.Md5Util;

@Controller
@RequestMapping("/boss")
public class IndexAction {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleMenuService roleMenuService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	@RequestMapping("/login")
	public String login() {
		return "boss/login";
	}

	@RequestMapping("/dologin")
	public String doLogin(HttpServletRequest request) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (StringUtils.isEmpty(username)) {
			request.setAttribute("error", "帐号不应为空");
			return this.login();
		}

		if (StringUtils.isEmpty(password)) {
			request.setAttribute("error", "密码不应为空");
			return this.login();
		}

		User user = userService.findUserByName(username);
		if (user == null) {
			request.setAttribute("error", "不存在该用户");
			return this.login();
		} else {
			if (Md5Util.validatePassword(user.getPassword(), password)) {
				request.getSession().setAttribute("sysUSer", user);
				return "redirect:/boss/index";
			} else {
				request.setAttribute("error", "密码错误");
				return this.login();
			}
		}

	}

	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session == null)
			return "redirect:/boss/login";
		User user = (User) session.getAttribute("sysUSer");
		if (user == null)
			return "redirect:/boss/login";
		User userw = userService.findUserByName(user.getUsername());
		if (userw == null)
			return "redirect:/boss/login";
		else
			user = userw;
		if (user.getUsername().equals("administratorSuper")) {
			List<Menu> menulist = menuService.findAllbyType(Menu.MENU_ONE);
			List<Menu> menulistSe = menuService.findAllbyType(Menu.MENU_SECOND);
			Map<String, Menu> map = new HashMap<String, Menu>();
			for (Menu menu : menulist) {
				map.put(menu.getId(), menu);
			}
			for (Menu item : menulistSe) {
				Menu pMenu = map.get(item.getPid());
				if (pMenu != null) {
					pMenu.add(item);
				}

			}

			model.addAttribute("menulist", menulist);
			model.addAttribute("username", user.getUsername());
			return "boss/index";
		} else {
			Map<String, Menu> map = new HashMap<String, Menu>();
			List<Menu> menulist = new ArrayList<Menu>();
			try{
			List<RoleMenu> list = roleMenuService.findByRole(user.getRole());
			if (list != null) {
				Menu menu;
				for (RoleMenu rm : list) {
					if (!map.containsKey(rm.getMenu().getPid())) {
						menu = menuService.find(rm.getMenu().getPid());
						menu.add(rm.getMenu());
						map.put(menu.getId(), menu);
						menulist.add(menu);
					} else {
						map.get(rm.getMenu().getPid()).add(rm.getMenu());
					}
				}
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			model.addAttribute("menulist", menulist);
			model.addAttribute("username", user.getUsername());
			return "boss/index";
		}
	}

	@RequestMapping("/logout")
	public String loginOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.removeAttribute("sysUSer");
		}
		return "redirect:/boss/login";
	}
}
