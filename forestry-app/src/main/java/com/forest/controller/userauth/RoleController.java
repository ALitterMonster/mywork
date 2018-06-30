package com.forest.controller.userauth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.entity.userauth.OperationRole;
import com.forest.service.userauth.RoleService;
import com.google.gson.Gson;

/**   
* @Title: UserController.java 
* @Description: ÓÃ»§¿ØÖÆÆ÷
* @author TingTing Song
* @version V1.0   
*/
@Controller
@RequestMapping(value = "/roleManager")
public class RoleController {

	@Resource
    private RoleService roleService;

    @RequestMapping("/toList.do")
    public String toList() {
        return "roleManager/list";
    }

    @RequestMapping(value="list.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public String getList(@RequestParam(name="roleName",required=false) String roleName,
    		@RequestParam(name="roleLevel",required=false) String roleLevel) {
    	OperationRole ou = new OperationRole();
    	ou.setRoleName(roleName);
    	ou.setRoleLevel(roleLevel);
		List<OperationRole> ulist = roleService.findRoleList(ou);
    	return new Gson().toJson(ulist);
    }
    
    @RequestMapping(value="roleComboBox.do",produces = "application/json; charset=utf-8")
   	@ResponseBody
	public String roleComboBox() {
		List<OperationRole> ulist = roleService.roleComboBox();
	   	return new Gson().toJson(ulist);
	}
         
    
    @RequestMapping(value="save.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void save(@RequestParam(name="data")String data) {
    	OperationRole ou = new OperationRole();
    	ou = new Gson().fromJson(data, OperationRole.class);
    	if(0 != ou.getRoleId()){
    		ou.setRoleId(ou.getRoleId());
    		roleService.updateRoleInfo(ou);
    	} else {
    		roleService.insertRoleInfo(ou);
    	}
    	
    }
    
    @RequestMapping(value="delete.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void delete(@RequestParam(name="ids")String ids) {
    	String[] ss = ids.split(",");
    	for(String s : ss){
    		if(!StringUtils.isEmpty(s))
    		roleService.deleteRoleInfo(Integer.parseInt(s));
    	}
    	
    }

}
