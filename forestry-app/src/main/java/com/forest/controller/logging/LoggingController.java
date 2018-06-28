package com.forest.controller.logging;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/logging")
public class LoggingController {
	
	/**
	 * �ɷ��ƻ�����ҳ��
	 * @return
	 */
	 @RequestMapping("/planList.do")
	 public String planList() {
	    return "logging/loggingPlan";
	  }
	 
	 @RequestMapping("/queryPlanList.do")
	 public String queryPlanList() {
	    return "logging/queryPlanList";
	  }
}
