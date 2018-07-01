package com.forest.controller.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.entity.userauth.OperationMenu;
import com.forest.entity.userauth.OperationUser;
import com.forest.service.userauth.MenuService;
import com.forest.service.userauth.UserService;
import com.google.gson.Gson;

/**   
* @Title: LoginController.java 
* @Description: 登录控制器
* @author TingTing Song
* @version V1.0   
*/
@Controller
@RequestMapping
public class LoginController {

	@Resource
    private UserService userService;
	
	@Resource
    private MenuService menuService;
	
	/** 
	* @Title: login 
	* @Description: 登录方法
	* @param @param map
	* @param @return  
	* @return String   
	* @throws 
	*/
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> login(@RequestParam Map<String,String> map, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "error");
		OperationUser user = new OperationUser();
		user  = userService.findForLogin(map.get("username"));
		if(null == user) result.put("msg", "用户名不存在！");
		else{
			if(user.getUserPwd().equals(map.get("pwd"))){
				session.setAttribute("user", user);
				List<OperationMenu> list = menuService.getMenuList(user.getUserId());
				List<OperationMenu> menuList = new ArrayList<OperationMenu>();
				for(OperationMenu om : list){
					if(om.getParentId() == 0)
						menuList.add(om);
				}
				for(OperationMenu om : menuList){
					om.setChildren((getChild(om.getId(), list)));
				}
				session.setAttribute("menus", menuList);
				result.put("result", "success");
			}else  result.put("msg", "密码错误！");
		}
		return result;
	}
	
	
	@RequestMapping(value="menus.do",method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getMenus(HttpSession session){
		List<OperationMenu> menuList = (List<OperationMenu>)session.getAttribute("menus");
		List list = new ArrayList<Map<String,Object>>();
		for(OperationMenu om : menuList){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", om.getId()+"");
			map.put("text", om.getText());
			map.put("iconCls", "fa fa-navicon");
			if(!StringUtils.isEmpty(om.getUrl() ))
				map.put("url", om.getUrl());
			if(null != om.getChildren()){
				map.put("children",getMenu(om.getChildren()));
			}
			list.add(map);
		}
		return new Gson().toJson(list);
	}
	
	private List<Map<String,Object>> getMenu(List<OperationMenu> rootMenu){
		List list = new ArrayList<Map<String,String>>();
		for(OperationMenu om : rootMenu){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", om.getId()+"");
			map.put("text", om.getText());
			map.put("iconCls", "fa fa-navicon");
			if(!StringUtils.isEmpty(om.getUrl() ))
				map.put("url", om.getUrl());
			if(null != om.getChildren()){
				map.put("children",getMenu(om.getChildren()));
			}
			list.add(map);
		}
		return list;
	}
	
	private List<OperationMenu> getChild(Integer id, List<OperationMenu> rootMenu) {
	    // 子菜单
	    List<OperationMenu> childList = new ArrayList<OperationMenu>();
	    for (OperationMenu menu : rootMenu) {
	        // 遍历所有节点，将父菜单id与传过来的id比较
            if (menu.getParentId() == id) {
                childList.add(menu);
            }
	    }
	    // 把子菜单的子菜单再循环一遍
	    for (OperationMenu menu : childList) {// 没有url子菜单还有子菜单
	            // 递归
	        menu.setChildren(getChild(menu.getId(), rootMenu));
	    } // 递归退出条件
	    if (childList.size() == 0) {
	        return null;
	    }
	    return childList;
	}
	
}
