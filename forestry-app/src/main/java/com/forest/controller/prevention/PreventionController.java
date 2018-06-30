package com.forest.controller.prevention;

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
import com.forest.dto.prevention.FirePreventionRecordQueryReusltDTO;
import com.forest.dto.prevention.FirePreventionRecordQueryReusltData;
import com.forest.dto.prevention.FireRecordQueryReusltDTO;
import com.forest.dto.prevention.FireRecordQueryReusltData;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;
import com.forest.service.prevention.FirePreventionRecordService;
import com.forest.service.prevention.FireRecordService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/prevention")
public class PreventionController {
	
	@Autowired
	private FireRecordService fireRecordServicce;
	@Autowired
	private FirePreventionRecordService firePreventionRecordService;
	
	/**
	 * 火灾情况记录管理页面
	 * @return
	 */
	 @RequestMapping(value="/fireRecordList.do",method = RequestMethod.GET)
	 public String planList() {
	    return "prevention/fireRecordList";
	 }
	 
	 @ResponseBody
	 @RequestMapping("/queryFireRecordList.do")
	 public String queryFireRecordList(@RequestParam(value="occurTime",required=false) String occurTime,
			 @RequestParam(value="dealTime",required=false) String dealTime,
			 @RequestParam(value="affectedArea",required=false) String affectedArea,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 FireRecordQueryReusltDTO resultDTO= new FireRecordQueryReusltDTO();
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 try {
		 if(!StringUtils.isEmpty(occurTime)){
			 queryParam.put("occurTime", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(occurTime));
		 }
		 if(!StringUtils.isEmpty(dealTime)){
			queryParam.put("dealTime", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(dealTime));
		 }
		 if(!StringUtils.isEmpty(affectedArea)){
			 queryParam.put("affectedArea",affectedArea);
		 }
		
		 resultDTO = fireRecordServicce.queryList(queryParam);
		 } catch (ParseException e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping("/queryFireRecordById.do")
	 public String queryFireRecordById(@RequestParam(value="id") String id) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 FireRecordQueryReusltData resultDTO= new FireRecordQueryReusltData();
		 
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = fireRecordServicce.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 
	 /**
	  * 新增火灾情况记录
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addFireRecord.do",method = RequestMethod.POST)
	 public String addPlan(@RequestParam("fireRecord") String fireRecord) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryFireRecord record = gson.fromJson(fireRecord, ForestryFireRecord.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(null == record.getOccurTime() || StringUtils.isEmpty(record.getAffectedArea())
				 || null == record.getDealTime()){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = fireRecordServicce.insertForestryFireRecord(record);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDeleteFireRecord.do",method = RequestMethod.POST)
	 public String batchDeleteFireRecord(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = fireRecordServicce.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 /**
	  * 更新火灾情况记录
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updateFireRecord.do",method = RequestMethod.POST)
	 public String updateFireRecord(@RequestParam("fireRecord") String fireRecord) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryFireRecord record = gson.fromJson(fireRecord, ForestryFireRecord.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(record.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = fireRecordServicce.updateForestryFireRecord(record);
		 return new Gson().toJson(resultDTO);
	  }
	 
	 /**
	 * 防火检查记录管理页面
	 * @return
	 */
	 @RequestMapping(value="/firePreventionRecordList.do",method = RequestMethod.GET)
	 public String firePreventionRecordList() {
	    return "prevention/firePreventionRecordList";
	  }
	 
	 @ResponseBody
	 @RequestMapping("/queryFirePreventionRecordList.do")
	 public String queryFirePreventionRecordList(@RequestParam(value="preventionResult",required=false) String preventionResult,
			 @RequestParam(value="preventionTime",required=false) String preventionTime,
			 @RequestParam(value="preventionArea",required=false) String preventionArea,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 FirePreventionRecordQueryReusltDTO resultDTO= new FirePreventionRecordQueryReusltDTO();
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 try {
		 if(!StringUtils.isEmpty(preventionTime)){
			 queryParam.put("preventionTime", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(preventionTime));
		 }
		 if(!StringUtils.isEmpty(preventionArea)){
			 queryParam.put("preventionArea",preventionArea);
		 }
		 if(!StringUtils.isEmpty(preventionResult)){
			 queryParam.put("preventionResult",preventionResult);
		 }
		
		 resultDTO = firePreventionRecordService.queryList(queryParam);
		 } catch (ParseException e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping("/queryFirePreventionRecordById.do")
	 public String queryFirePreventionRecordById(@RequestParam(value="id") String id) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 FirePreventionRecordQueryReusltData resultDTO= new FirePreventionRecordQueryReusltData();
		 
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = firePreventionRecordService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	  }
	 
	 /**
	  * 新增防火检查记录
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addFirePreventionRecord.do",method = RequestMethod.POST)
	 public String addFirePreventionRecord(@RequestParam("fireRecord") String fireRecord) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryFirePreventionRecord record = gson.fromJson(fireRecord, ForestryFirePreventionRecord.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(null == record.getPreventionTime() || StringUtils.isEmpty(record.getPreventionArea())
				 || StringUtils.isEmpty(record.getPreventionResult())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = firePreventionRecordService.insertForestryFirePreventionRecord(record);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDeleteFirePreventionRecord.do",method = RequestMethod.POST)
	 public String batchDeleteFirePreventionRecord(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = firePreventionRecordService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	  }
	 
	 /**
	  * 更新防火检查记录
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updateFirePreventionRecord.do",method = RequestMethod.POST)
	 public String updateFirePreventionRecord(@RequestParam("fireRecord") String fireRecord) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryFirePreventionRecord record = gson.fromJson(fireRecord, ForestryFirePreventionRecord.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(record.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = firePreventionRecordService.updateForestryFirePreventionRecord(record);
		 return new Gson().toJson(resultDTO);
	  }
		 
}
