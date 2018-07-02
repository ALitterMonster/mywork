package com.forest.controller.forum;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.forest.entity.forum.KbQaAnswer;
import com.forest.entity.forum.KbQaQuestion;
import com.forest.entity.userauth.OperationUser;
import com.forest.service.block.BlockService;
import com.forest.service.forum.AnswerService;
import com.forest.service.forum.QuestionService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping(value = "/answer")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	
	
	 @ResponseBody
	 @RequestMapping(value="/queryList.do",produces = "application/json; charset=utf-8")
	 public String queryBlockList(@RequestParam("questionid") String questionid) {
		 Map<String ,Object> queryParam = new HashMap<String ,Object>();
		 queryParam.put("questionid", questionid);
		 List<KbQaAnswer> result= answerService.queryList(queryParam);
		 return new Gson().toJson(result);
	 }
	 
	 /**
	  * 新增区块信息
	  * @param block
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="/add.do",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public String addBlock(@RequestParam("data") String data,HttpSession session) {
		 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create(); 
		 OperationUser user = (OperationUser)session.getAttribute("user");
		 KbQaAnswer record = gson.fromJson(data, KbQaAnswer.class);
		 record.setAnswername(user.getUserName());
		 BaseResultDTO resultDTO = new BaseResultDTO();
		 record = answerService.insert(record);
		 return new Gson().toJson(record);
	 }
}
