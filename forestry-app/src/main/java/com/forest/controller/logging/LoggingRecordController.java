package com.forest.controller.logging;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingRecordQueryReusltDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingRecord;
import com.forest.service.logging.LoggingPlanService;
import com.forest.service.logging.LoggingRecordService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/loggingRecord")
public class LoggingRecordController {
	@Autowired
	private LoggingRecordService loggingRecordService; 
	/**
	 * 采伐记录管理页面
	 * @return
	 */
	 @RequestMapping("/recordList.do")
	 public String planList() {
	    return "logging/loggingRecord";
	  }
	 @ResponseBody
	 @RequestMapping(value="/queryRecordList.do",method = RequestMethod.GET)
	 public String queryPlanList(
			 @RequestParam("createdStart") String createdStart,@RequestParam("createdEnd") String createdEnd) {
		 LoggingRecordQueryReusltDTO resultDTO= new LoggingRecordQueryReusltDTO();
		 try{
			 Map<String ,Object> queryParam = new HashMap<String ,Object>();
			 
			 queryParam.put("planName","planName");
			 try {
			 if(!StringUtils.isEmpty(createdStart)){
				 queryParam.put("createdStart", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(createdStart));
			 }
			 if(!StringUtils.isEmpty(createdEnd)){
				queryParam.put("endAt", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(createdEnd));
			 }
			 } catch (ParseException e) {
					e.printStackTrace();
					resultDTO.setError();
				}
			 resultDTO = loggingRecordService.queryList(queryParam);
			 return new Gson().toJson(resultDTO);
		 }catch(Exception e){
			 resultDTO.setError();
			 return new Gson().toJson(resultDTO);
		 }
	  }
	 /**
	  * 新增采伐计划
	  * @param data
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value = "/addPlan.do",method = RequestMethod.POST)
	 public String addPlan(@RequestParam("data") String data) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 try{
			 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
			 ForestryLoggingRecord dataDTO = gson.fromJson(data, ForestryLoggingRecord.class);
			 if(StringUtils.isEmpty(dataDTO.getArea())||dataDTO.getAmout()!=null
					 ||StringUtils.isEmpty(dataDTO.getIsLegal())){
				 resultDTO.setParamError();
				 return new Gson().toJson(resultDTO);
			 }
			 resultDTO = loggingRecordService.insertRecord(dataDTO);
		 }catch(Exception e){
			 resultDTO.setError();
			 return new Gson().toJson(resultDTO);
		 }
		 
		 return new Gson().toJson(resultDTO);
	  }
	 /**
	  * 更新采伐记录
	  * @param data
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updateRecord.do" ,method = RequestMethod.POST)
	 public String updatePlan(@RequestParam("data") String data) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 try{
			 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
			 ForestryLoggingRecord dataDTO = gson.fromJson(data, ForestryLoggingRecord.class);
			 
			 if(StringUtils.isEmpty(dataDTO.getId().toString())){
				 resultDTO.setParamError();
				 return new Gson().toJson(resultDTO);
			 }
			 resultDTO = loggingRecordService.updateReocrd(dataDTO);
			 return new Gson().toJson(resultDTO);
		 }catch(Exception e){
			 resultDTO.setError();
			 return new Gson().toJson(resultDTO);
		 }
	  }
}
