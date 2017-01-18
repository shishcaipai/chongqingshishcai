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
import org.springframework.web.servlet.ModelAndView;

import com.caijin.I000Wan.entity.ChongZhiRecord;
import com.caijin.I000Wan.entity.MemberUser;
import com.caijin.I000Wan.entity.Menu;
import com.caijin.I000Wan.entity.Role;
import com.caijin.I000Wan.entity.RoleMenu;
import com.caijin.I000Wan.entity.User;
import com.caijin.I000Wan.service.ChongZhiRecordService;
import com.caijin.I000Wan.service.MemberUserService;
import com.caijin.I000Wan.service.MenuService;
import com.caijin.I000Wan.service.RoleMenuService;
import com.caijin.I000Wan.service.RoleService;
import com.caijin.I000Wan.service.RoleUserService;
import com.caijin.I000Wan.service.UserService;
import com.caijin.I000Wan.util.Md5Util;

@Controller
@RequestMapping("/boss")
public class RoleMenuAction {

	@Autowired
	private RoleMenuService roleMenuService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleUserService roleUserService;

	@RequestMapping("/role/list")
	public ModelAndView roles(HttpServletRequest request, HttpServletResponse response) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("menus", menuService.findAll());
		return new ModelAndView("boss/role/rolelist",map);
	}

	@RequestMapping("/menu/list")
	public String menus() {
		return "boss/role/menuList";
	}

	@RequestMapping("/role/ajax_menu_list")
	@ResponseBody
	public List<Menu> getMenu() {
		return menuService.findAll();
	}

	@RequestMapping("/role/ajax_role_list")
	@ResponseBody
	public List<Role> getRole() {
		return roleService.findAll();
	}

	@RequestMapping("/role/ajax_menu_save")
	@ResponseBody
	public Map saveMenu(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map result = new HashMap();
		result.put("sucess", false);

		request.setCharacterEncoding("UTF-8");
		try {
			String menuName = request.getParameter("menu");
			String path = request.getParameter("menuPath");
			System.out.println("----------------------test");
			Menu menu = new Menu();
			menu.setCreateDate(new Date());
			menu.setMenu(menuName);
			menu.setMenuPath(path);
			menu.setUpdateDate(new Date());
			menuService.save(menu);
			result.put("sucess", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/role/ajax_role_save")
	@ResponseBody
	public Map saveRole(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map result = new HashMap();
		result.put("sucess", false);
		try {
			String roleName = request.getParameter("roleName");
			String descption = request.getParameter("descption");
			String menus = request.getParameter("menu");
			System.out.println("----menus-----"+menus);
			Role role = new Role();
			role.setCreateDate(new Date());
			role.setRoleName(roleName);
			role.setDescption(descption);
			role.setUpdateDate(new Date());
			roleService.save(role);
			if(menus!=null){
			String[] mes=menus.split(",");
			RoleMenu  roleMenu;
			Menu menuObj;
			for(String menu:mes){
				menuObj=menuService.find(menu);
				  roleMenu=new RoleMenu();
				roleMenu.setCreateDate(new Date());
				roleMenu.setUpdateDate(new Date());
				roleMenu.setMenu(menuObj);
				roleMenu.setRole(role);
				roleMenuService.save(roleMenu);
			}
			}
			result.put("sucess", true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/role/ajax_menu_role_list")
	@ResponseBody
	public List<Menu> getMenuRole(HttpServletRequest request,
			HttpServletResponse response) {
		String roleId = request.getParameter("roleid");
		return menuService.findByRoleId(roleId);
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
