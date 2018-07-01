package com.forest.controller.publicservice;

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
import com.forest.dto.publicservice.PublicServiceQueryReusltDTO;
import com.forest.dto.publicservice.PublicServiceQueryReusltData;
import com.forest.entity.publicservice.ForestryPublicServiceRecord;
import com.forest.entity.userauth.OperationUser;
import com.forest.service.publicservice.PublicServiceService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/publicservice")
public class PublicServiceController {
	
	@Autowired
	private PublicServiceService publicServiceService;
	
	/**
	 * 生态公益事业管理页面
	 * @return
	 */
	 @RequestMapping(value="/publicServiceList.do",method = RequestMethod.GET)
	 public String publicServiceList() {
	    return "publicservice/publicServiceList";
	 }
	 
	 @ResponseBody
	 @RequestMapping("/queryPublicServiceList.do")
	 public String queryPublicServiceList(
			 @RequestParam(value="treeSpecies",required=false) String treeSpecies,
			 @RequestParam(value="name",required=false) String name,
			 @RequestParam(value="treeNum",required=false) String treeNum,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 PublicServiceQueryReusltDTO resultDTO= new PublicServiceQueryReusltDTO();
		 try {
			 if(!StringUtils.isEmpty(treeSpecies))
				 queryParam.put("treeSpecies",treeSpecies);
			 if(!StringUtils.isEmpty(name))
				 queryParam.put("name",name);
			 if(!StringUtils.isEmpty(treeNum)) 
				 queryParam.put("treeNum",Integer.parseInt(treeNum));
			 
			 queryParam.put("pageIndex",Integer.parseInt(pageIndex));
			 queryParam.put("pageSize",Integer.parseInt(pageSize));
		
			 if(!StringUtils.isEmpty(treeNum)) {
				 queryParam.put("treeNum",Integer.parseInt(treeNum));
			 }
			 resultDTO = publicServiceService.queryList(queryParam);
			 } catch (Exception e) {
					e.printStackTrace();
					resultDTO.setError();
			}
		 return new Gson().toJson(resultDTO);
	 }
	 
	 @ResponseBody
	 @RequestMapping("/queryPublicServiceById.do")
	 public String queryPublicServiceById(@RequestParam(value="id") String id) {
		 PublicServiceQueryReusltData resultDTO= new PublicServiceQueryReusltData();
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = publicServiceService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 新增公益事业记录
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addPublicService.do",method = RequestMethod.POST)
	 public String addPublicService(@RequestParam("wetlands") String wetlands, HttpSession session) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryPublicServiceRecord record = gson.fromJson(wetlands, ForestryPublicServiceRecord.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(null == record.getPlantingTime() || StringUtils.isEmpty(record.getTreeSpecies())
				 || StringUtils.isEmpty(record.getName()) || null == record.getTreeNum()){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 
		 OperationUser user = (OperationUser)session.getAttribute("user");
		 record.setCreatedBy(user.getUserName());
		 resultDTO = publicServiceService.insertPublicService(record);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDeletePublicService.do",method = RequestMethod.POST)
	 public String batchDeletePublicService(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = publicServiceService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 更新公益事业信息
	  * @param fireRecord
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updatePublicService.do",method = RequestMethod.POST)
	 public String updatePublicService(@RequestParam("wetlands") String wetlands) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryPublicServiceRecord record = gson.fromJson(wetlands, ForestryPublicServiceRecord.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(record.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = publicServiceService.updatePublicService(record);
		 return new Gson().toJson(resultDTO);
	 }
	 
}
