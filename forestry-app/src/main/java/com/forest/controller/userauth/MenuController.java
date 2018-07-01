package com.forest.controller.userauth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.entity.userauth.OperationMenu;
import com.forest.service.userauth.MenuService;
import com.google.gson.Gson;

/**   
* @Title: UserController.java 
* @Description: ÓÃ»§¿ØÖÆÆ÷
* @author TingTing Song
* @version V1.0   
*/
@Controller
@RequestMapping(value = "/menuManager")
public class MenuController {

	@Resource
    private MenuService menuService;

    @RequestMapping("/toList.do")
    public String toList() {
        return "menuManager/list";
    }

    @RequestMapping(value="list.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public String getList(@RequestParam(name="menuName",required=false) String menuName) {
    	OperationMenu ou = new OperationMenu();
    	ou.setText(menuName);
		List<OperationMenu> ulist = menuService.menuList(ou);
    	return new Gson().toJson(ulist);
    }
    
    @RequestMapping(value="save.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void save(@RequestParam(name="data")String data) {
    	OperationMenu ou = new OperationMenu();
    	ou = new Gson().fromJson(data, OperationMenu.class);
    	if(0 != ou.getId()){
    		menuService.updateMenuInfo(ou);
    	} else {
    		menuService.insertMenuInfo(ou);
    	}
    	
    }
    
    
    @RequestMapping(value="delete.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void delete(@RequestParam(name="ids")String ids) {
    	String[] ss = ids.split(",");
    	for(String s : ss){
    		if(!StringUtils.isEmpty(s))
    			menuService.deleteMenuInfo(Integer.parseInt(s));
    	}
    	
    }
    

}
