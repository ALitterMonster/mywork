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
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.logging.LoggingRecordQueryReusltDTO;
import com.forest.dto.logging.LoggingRecordQueryReusltData;
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
	 public String recordList() {
	    return "logging/loggingRecord";
	  }
	 
	 @RequestMapping("/notAllowRecordList.do")
	 public String notAllowRecordList() {
	    return "logging/loggingNotAllowedRecord";
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/queryRecordList.do",produces = "application/json; charset=utf-8")
	 public String queryPlanList(@RequestParam(value="createdBy",required=false) String createdBy,
			 @RequestParam(value="startAt",required=false) String startAt,
			 @RequestParam(value="endAt",required=false) String endAt,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize,
			 @RequestParam(value="isLegal",required=false) String isLegal) {
		 LoggingRecordQueryReusltDTO resultDTO= new LoggingRecordQueryReusltDTO();
		 try{
			 Map<String ,Object> queryParam = new HashMap<String ,Object>();
			 
			 queryParam.put("pageIndex",Integer.parseInt(pageIndex)*Integer.parseInt(pageSize));
			 queryParam.put("pageSize",Integer.parseInt(pageSize));
			 queryParam.put("isValid","1");
			 queryParam.put("isLegal",isLegal);
			 queryParam.put("createdBy",createdBy);
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
	 @RequestMapping(value = "/addRecord.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String addPlan(@RequestParam("data") String data) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 try{
			 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
			 ForestryLoggingRecord dataDTO = gson.fromJson(data, ForestryLoggingRecord.class);
			 if(StringUtils.isEmpty(dataDTO.getArea())||dataDTO.getAmout()==null
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
	 @RequestMapping(value="/updateRecord.do" ,method = RequestMethod.POST,produces = "application/json; charset=utf-8")
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
			 resultDTO.setSucccess();
			 return new Gson().toJson(resultDTO);
		 }catch(Exception e){
			 resultDTO.setError();
			 return new Gson().toJson(resultDTO);
		 }
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDelete.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String batchDelete(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = loggingRecordService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/queryById.do",produces = "application/json; charset=utf-8")
	 public String queryById(@RequestParam(value="id") String id) {
		 LoggingRecordQueryReusltData resultDTO= new LoggingRecordQueryReusltData();
		 
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = loggingRecordService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
}
