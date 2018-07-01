package com.forest.controller.park;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.park.ParkQueryReusltDTO;
import com.forest.dto.park.ParkQueryReusltData;
import com.forest.entity.park.ForestryPark;
import com.forest.entity.userauth.OperationUser;
import com.forest.service.park.ParkService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/park")
public class ParkController {
	
	@Autowired
	private ParkService parkService;
	
	/**
	 * 森林公园管理页面
	 * @return
	 */
	 @RequestMapping(value="/parkList.do",method = RequestMethod.GET)
	 public String parkList() {
	    return "park/parkList";
	 }
	 
	 @ResponseBody
	 @RequestMapping("/queryParkList.do")
	 public String queryParkList(@RequestParam(value="periodStart",required=false) String periodStart,
			 @RequestParam(value="periodEnd",required=false) String periodEnd,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 ParkQueryReusltDTO resultDTO= new ParkQueryReusltDTO();
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 try {
			 if(!StringUtils.isEmpty(periodStart)){
				 queryParam.put("periodStart", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(periodStart));
			 }
			 if(!StringUtils.isEmpty(periodEnd)){
				queryParam.put("periodEnd", new SimpleDateFormat("yyy-MM-dd HH:mm:ss").parse(periodEnd));
			 }
			 
			 resultDTO = parkService.queryList(queryParam);
			 } catch (ParseException e) {
					e.printStackTrace();
					resultDTO.setError();
			}
		 return new Gson().toJson(resultDTO);
	  }
	 
	 @ResponseBody
	 @RequestMapping("/queryParkById.do")
	 public String queryParkById(@RequestParam(value="id") String id) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 ParkQueryReusltData resultDTO= new ParkQueryReusltData();
		 
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = parkService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 新增森林公园记录
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addPark.do",method = RequestMethod.POST)
	 public String addPark(@RequestParam("park") String park,HttpSession session) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryPark record = gson.fromJson(park, ForestryPark.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(null == record.getPeriodStart() || null == record.getPeriodEnd()){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 OperationUser user = (OperationUser)session.getAttribute("user");
		 record.setCreatedBy(user.getUserName()+"");
		 resultDTO = parkService.insertPark(record);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDeletePark.do",method = RequestMethod.POST)
	 public String batchDeletePark(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = parkService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 更新森林公园信息
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updatePark.do",method = RequestMethod.POST)
	 public String updatePark(@RequestParam("park") String park) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryPark record = gson.fromJson(park, ForestryPark.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(record.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = parkService.updatePark(record);
		 return new Gson().toJson(resultDTO);
	 }
	 
}
