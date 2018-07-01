package com.forest.controller.wetlands;

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
import com.forest.dto.wetlands.WetlandsQueryReusltDTO;
import com.forest.dto.wetlands.WetlandsQueryReusltData;
import com.forest.entity.wetlands.ForestryWetlands;
import com.forest.service.wetlands.WetlandsService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/wetlands")
public class WetlandsController {
	
	@Autowired
	private WetlandsService wetlandsService;
	
	/**
	 * 湿地管理页面
	 * @return
	 */
	 @RequestMapping(value="/wetlandsList.do")
	 public String wetlandsList() {
	    return "wetlands/wetlandsList";
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/queryWetlandsList.do",produces = "application/json; charset=utf-8")
	 public String queryWetlandsList(@RequestParam(value="periodStart",required=false) String periodStart,
			 @RequestParam(value="name",required=false) String name,
			 @RequestParam(value="area",required=false) String area,
			 @RequestParam(value="periodEnd",required=false) String periodEnd,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 WetlandsQueryReusltDTO resultDTO= new WetlandsQueryReusltDTO();
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 try {
			 if(!StringUtils.isEmpty(periodStart)){
				 queryParam.put("periodStart", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(periodStart));
			 }
			 if(!StringUtils.isEmpty(name)){
				 queryParam.put("name",name);
			 }
			 if(!StringUtils.isEmpty(area)){
				 queryParam.put("area", area);
			 }
			 if(!StringUtils.isEmpty(periodEnd)){
				queryParam.put("periodEnd", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(periodEnd));
			 }
			 
			 resultDTO = wetlandsService.queryList(queryParam);
			 } catch (ParseException e) {
					e.printStackTrace();
					resultDTO.setError();
			}
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping(value="/queryWetlandsById.do",produces = "application/json; charset=utf-8")
	 public String queryWetlandsById(@RequestParam(value="id") String id) {
		 WetlandsQueryReusltData resultDTO= new WetlandsQueryReusltData();
		 
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = wetlandsService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 新增湿地记录
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addWetlands.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String addWetlands(@RequestParam("wetlands") String wetlands) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryWetlands record = gson.fromJson(wetlands, ForestryWetlands.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(null == record.getPeriodStart() || null == record.getPeriodEnd()){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = wetlandsService.insertWetlands(record);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDeleteWetlands.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String batchDeleteWetlanda(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = wetlandsService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 更新湿地信息
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updateWetlands.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String updatePark(@RequestParam("wetlands") String wetlands) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryWetlands record = gson.fromJson(wetlands, ForestryWetlands.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(record.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = wetlandsService.updateWetlands(record);
		 return new Gson().toJson(resultDTO);
	 }
	 
}
