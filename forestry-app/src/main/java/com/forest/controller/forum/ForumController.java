package com.forest.controller.forum;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.forest.dto.block.BlockQueryReusltDTO;
import com.forest.dto.block.BlockQueryReusltData;
import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.block.ForestryBlock;
import com.forest.service.block.BlockService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/forum")
public class ForumController {
	
	@Autowired
	private BlockService blockService;
	
	/**
	 * 区块信息管理页面
	 * @return
	 */
	 @RequestMapping(value="/forum.do")
	 public String parkList() {
	    return "forum/forum_talk";
	 }
	 
	 @ResponseBody
	 @RequestMapping("/queryBlockList.do")
	 public String queryBlockList(@RequestParam(value="blockType",required=false) String blockType,
			 @RequestParam(value="longitude",required=false) String longitude,
			 @RequestParam(value="latitude",required=false) String latitude,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 BlockQueryReusltDTO resultDTO= new BlockQueryReusltDTO();
		 if(!StringUtils.isEmpty(blockType)){
			 queryParam.put("blockType",blockType);
		 }
		 if(!StringUtils.isEmpty(longitude)){
			 queryParam.put("longitude",longitude);
		 }
		 if(!StringUtils.isEmpty(latitude)){
			 queryParam.put("latitude",latitude);
		 }
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 resultDTO = blockService.queryList(queryParam);
		 return new Gson().toJson(resultDTO);
	 }
	 
	 @ResponseBody
	 @RequestMapping("/queryBlockById.do")
	 public String queryBockById(@RequestParam(value="id") String id) {
		 BlockQueryReusltData resultDTO= new BlockQueryReusltData();
		 try {
		 if(StringUtils.isEmpty(id)){
			resultDTO.setParamError();
			return new Gson().toJson(resultDTO);
		 }
		 resultDTO = blockService.selectByPrimaryKey(Integer.parseInt(id));
		 } catch (Exception e) {
				e.printStackTrace();
				resultDTO.setError();
		}
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 新增区块信息
	  * @param block
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/addBlock.do",method = RequestMethod.POST)
	 public String addBlock(@RequestParam("block") String block) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryBlock record = gson.fromJson(block, ForestryBlock.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(record.getBlockType()) || StringUtils.isEmpty(record.getLongitude())
				 || StringUtils.isEmpty(record.getLatitude())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = blockService.insertBlock(record);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDeleteBlock.do",method = RequestMethod.POST)
	 public String batchDeleteBlock(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = blockService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 更新区块信息
	  * @param block
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/updateBlock.do",method = RequestMethod.POST)
	 public String updateBlock(@RequestParam("block") String block) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 ForestryBlock record = gson.fromJson(block, ForestryBlock.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(record.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = blockService.updateBlock(record);
		 return new Gson().toJson(resultDTO);
	 }
	 
}
