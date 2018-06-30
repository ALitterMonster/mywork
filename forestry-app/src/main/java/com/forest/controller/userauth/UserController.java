package com.forest.controller.userauth;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.entity.userauth.OperationUser;
import com.forest.service.userauth.UserService;
import com.google.gson.Gson;

/**   
* @Title: UserController.java 
* @Description: ÓÃ»§¿ØÖÆÆ÷
* @author TingTing Song
* @version V1.0   
*/
@Controller
@RequestMapping(value = "/userauth")
public class UserController {

	@Resource
    private UserService userService;

    @RequestMapping("/toList.do")
    public String toList() {
        return "userauth/list";
    }

    @RequestMapping(value="list.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public String getList(@RequestParam(name="userName",required=false) String userName,
    		@RequestParam(name="name",required=false) String name,
    		@RequestParam(name="isValid",required=false) Integer isValid) {
    	OperationUser ou = new OperationUser();
    	ou.setIsValid(isValid);
    	ou.setName(name);
    	ou.setUserName(userName);
		List<OperationUser> ulist = userService.findUserList(ou);
    	return new Gson().toJson(ulist);
    }
    
    @RequestMapping(value="save.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void save(@RequestParam(name="data")String data) {
    	OperationUser ou = new OperationUser();
    	ou = new Gson().fromJson(data, OperationUser.class);
    	ou.setUpdateDate(new Date());
    	if(0 != ou.getUserId()){
    		ou.setUserId(ou.getUserId());
    		userService.updateUserInfo(ou);
    		userService.updateUserRole(ou);
    	} else {
    		ou.setCreateDate(new Date());
    		userService.insertUserInfo(ou);
    		userService.insertUserRole(ou);
    	}
    	
    }
    
    @RequestMapping(value="delete.do",produces = "application/json; charset=utf-8")
	@ResponseBody
    public void delete(@RequestParam(name="ids")String ids) {
    	String[] ss = ids.split(",");
    	for(String s : ss){
    		if(!StringUtils.isEmpty(s))
    		userService.deleteUserInfo(Integer.parseInt(s));
    	}
    	
    }

}
