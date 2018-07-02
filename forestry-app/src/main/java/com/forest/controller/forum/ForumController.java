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
import com.forest.dto.forum.KbQaQuestionDTO;
import com.forest.entity.block.ForestryBlock;
import com.forest.entity.forum.KbQaQuestion;
import com.forest.service.block.BlockService;
import com.forest.service.forum.QuestionService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/forum")
public class ForumController {
	
	@Autowired
	private QuestionService questionService;
	
	/**
	 * 区块信息管理页面
	 * @return
	 */
	 @RequestMapping(value="/forum.do")
	 public String parkList() {
	    return "forum/forum_talk";
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/queryList.do",produces = "application/json; charset=utf-8")
	 public String queryBlockList(@RequestParam(value="title",required=false) String title,
			 @RequestParam(value="pageIndex",required=false) String pageIndex,
			 @RequestParam(value="pageSize",required=false) String pageSize) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 KbQaQuestionDTO resultDTO= new KbQaQuestionDTO();
		 if(!StringUtils.isEmpty(title)){
			 queryParam.put("title",title);
		 }
		 queryParam.put("pageIndex",Integer.parseInt(pageIndex));
		 queryParam.put("pageSize",Integer.parseInt(pageSize));
		 resultDTO = questionService.queryList(queryParam);
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 新增区块信息
	  * @param block
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/add.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String addBlock(@RequestParam("data") String data) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 KbQaQuestion record = gson.fromJson(data, KbQaQuestion.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 
		 resultDTO = questionService.insert(record);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/batchDelete.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String batchDeleteBlock(@RequestParam("ids") String ids) {
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(ids)){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = questionService.batchDelete(ids);
		 
		 return new Gson().toJson(resultDTO);
	 }
	 
	 /**
	  * 更新区块信息
	  * @param block
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/update.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String updateBlock(@RequestParam("data") String data) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 KbQaQuestion question = gson.fromJson(data, KbQaQuestion.class);
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 if(StringUtils.isEmpty(question.getId().toString())){
			 resultDTO.setParamError();
			 return new Gson().toJson(resultDTO);
		 }
		 resultDTO = questionService.update(question);
		 return new Gson().toJson(resultDTO);
	 }
	 
}
