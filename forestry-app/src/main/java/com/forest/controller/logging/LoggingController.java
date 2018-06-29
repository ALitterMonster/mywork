package com.forest.controller.logging;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.service.logging.LoggingPlanService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/loggingPlan")
public class LoggingController {
	
	@Autowired
	private LoggingPlanService loggingPlanService; 
	/**
	 * 采伐计划管理页面
	 * @return
	 */
	 @RequestMapping(value="/planList.do",method = RequestMethod.GET)
	 public String planList() {
	    return "logging/loggingPlan";
	  }
	 @ResponseBody
	 @RequestMapping("/queryPlanList.do")
	 public String queryPlanList(@RequestParam("planName") String planName,
			 @RequestParam("startAt") String startAt,@RequestParam("endAt") String endAt) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 LoggingPlanQueryReusltDTO resultDTO= new LoggingPlanQueryReusltDTO();
		 queryParam.put("planName","planName");
		 try {
		 if(!StringUtils.isEmpty(startAt)){
			 queryParam.put("startAt", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(startAt));
		 }
		 if(!StringUtils.isEmpty(endAt)){
			queryParam.put("endAt", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(endAt));
		 }
		 } catch (ParseException e) {
				e.printStackTrace();
				resultDTO.setError();
			}
		 resultDTO = loggingPlanService.queryList(queryParam);
		 return new Gson().toJson(resultDTO);
	  }
	 /**
	  * 新增采伐计划
	  * @param planInfo
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addPlan.do",method = RequestMethod.POST)
	 public String addPlan(@RequestParam("planInfo") String planInfo) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryLoggingPlan plan = gson.fromJson(planInfo, ForestryLoggingPlan.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(plan.getAmount())||StringUtils.isEmpty(plan.getPlanName())
				 ||StringUtils.isEmpty(plan.getArea())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = loggingPlanService.insertPlan(plan);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 /**
	  * 更新采伐计划
	  * @param planInfo
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updatePlan.do",method = RequestMethod.POST)
	 public String updatePlan(@RequestParam("updatePlan") String planInfo) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryLoggingPlan plan = gson.fromJson(planInfo, ForestryLoggingPlan.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(plan.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = loggingPlanService.updatePlan(plan);
		 return new Gson().toJson(resultDTO);
	  }
}
