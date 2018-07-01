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
import com.forest.dto.logging.LoggingPlanQueryReusltData;
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
	 @RequestMapping(value="/planList.do",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
	 public String planList() {
	    return "logging/loggingPlan";
	  }
	 @ResponseBody
	 @RequestMapping(value="/queryPlanList.do",produces = "application/json; charset=utf-8")
	 public String queryPlanList(@RequestParam(value="planName",required=false) String planName,
			 @RequestParam(value="startAt",required=false) String startAt,
			 @RequestParam(value="endAt",required=false) String endAt,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 LoggingPlanQueryReusltDTO resultDTO= new LoggingPlanQueryReusltDTO();
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex)*Integer.parseInt(pageSize));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 queryParam.put("isValid","1");
		 try {
		 if(!StringUtils.isEmpty(startAt)){
			 queryParam.put("startAt", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(startAt));
		 }
		 if(!StringUtils.isEmpty(endAt)){
			queryParam.put("endAt", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(endAt));
		 }
		 if(!StringUtils.isEmpty(planName)){
			 queryParam.put("planName",planName);
		 }
		
		 resultDTO = loggingPlanService.queryList(queryParam);
		 } catch (ParseException e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 @ResponseBody
	 @RequestMapping(value="/queryById.do",produces = "application/json; charset=utf-8")
	 public String queryById(@RequestParam(value="id") String id) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 LoggingPlanQueryReusltData resultDTO= new LoggingPlanQueryReusltData();
		 
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = loggingPlanService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 /**
	  * 新增采伐计划
	  * @param planInfo
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addPlan.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
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
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDelete.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String batchDelete(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = loggingPlanService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 /**
	  * 更新采伐计划
	  * @param planInfo
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updatePlan.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String updatePlan(@RequestParam("planInfo") String planInfo) {
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
