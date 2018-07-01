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
import com.forest.dto.logging.LoggingPlanCheckQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.logging.LoggingRecordQueryReusltDTO;
import com.forest.dto.logging.LoggingRecordQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingPlanCheck;
import com.forest.entity.logging.ForestryLoggingRecord;
import com.forest.service.logging.LoggingCheckService;
import com.forest.service.logging.LoggingPlanService;
import com.forest.service.logging.LoggingRecordService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/loggingCheck")
public class LoggingCheckController {
	@Autowired
	private LoggingCheckService loggingCheckService;
	/**
	 * 管理页面
	 * @return
	 */
	 @RequestMapping("/checkList.do")
	 public String recordList() {
	    return "logging/loggingPlanCheck";
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/queryList.do",produces = "application/json; charset=utf-8")
	 public String queryPlanList(@RequestParam(value="planName",required=false) String planName,
			 @RequestParam(value="status",required=false) String status,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 LoggingPlanCheckQueryReusltDTO resultDTO= new LoggingPlanCheckQueryReusltDTO();
		 try{
			 Map<String ,Object> queryParam = new HashMap<String ,Object>();
			 
			 queryParam.put("pageIndex",Integer.parseInt(pageIndex)*Integer.parseInt(pageSize));
			 queryParam.put("pageSize",Integer.parseInt(pageSize));
			 queryParam.put("isValid","1");
			 try {
			 if(!StringUtils.isEmpty(status)){
				 queryParam.put("status",status);
			 }
			 if(!StringUtils.isEmpty(planName)){
				 queryParam.put("planName",planName);
			 }
			 resultDTO = loggingCheckService.queryList(queryParam);
			 } catch (Exception e) {
					e.printStackTrace();
					resultDTO.setError();
				}
			 
			 return new Gson().toJson(resultDTO);
		 }catch(Exception e){
			 resultDTO.setError();
			 return new Gson().toJson(resultDTO);
		 }
	  }
	
	 /**
	  * 更新采伐记录
	  * @param data
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/update.do" ,method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String updatePlan(@RequestParam("id") String id,
			 @RequestParam("status") String status,
			 @RequestParam("remark") String remark) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 try{
			 ForestryLoggingPlanCheck dataDTO = new ForestryLoggingPlanCheck();
			 dataDTO.setId(new Integer(id));
			 dataDTO.setRemark(remark);
			 dataDTO.setStatus(status);
			 
			 if(StringUtils.isEmpty(dataDTO.getId().toString())){
				 resultDTO.setParamError();
				 return new Gson().toJson(resultDTO);
			 }
			 resultDTO = loggingCheckService.updateCheck(dataDTO);
			 return new Gson().toJson(resultDTO);
		 }catch(Exception e){
			 resultDTO.setError();
			 return new Gson().toJson(resultDTO);
		 }
	  }
	 
	
}
