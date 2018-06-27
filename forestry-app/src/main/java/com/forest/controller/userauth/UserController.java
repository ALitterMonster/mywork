package com.forest.controller.userauth;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.entity.userauth.OperationUser;
import com.forest.service.userauth.UserService;

/**   
* @Title: UserController.java 
* @Description: ÓÃ»§¿ØÖÆÆ÷
* @author TingTing Song
* @version V1.0   
*/
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
    private UserService userService;

    @RequestMapping("/view.do")
    public String view() {
        return "main";
    }

    @RequestMapping("/indexview")
    public String index() {
        return "main/index";
    }

    @RequestMapping(value = "/getUserList.do", method = RequestMethod.POST)
    public String getUserList(OperationUser u, HttpServletResponse response) {
		List<OperationUser> ulist = userService.findByUsername(u);
    	return "";
    }

}
