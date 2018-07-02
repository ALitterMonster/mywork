package com.forest.service.forum;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.block.ForestryBlockMapper;
import com.forest.dao.forum.KbQaQuestionMapper;
import com.forest.dto.block.BlockQueryReusltDTO;
import com.forest.dto.block.BlockQueryReusltData;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.forum.KbQaQuestionDTO;
import com.forest.entity.block.ForestryBlock;
import com.forest.entity.forum.KbQaQuestion;

@Service
public class QuestionService {

	@Autowired
	private KbQaQuestionMapper kbQaQuestionMapper;

	public BaseResultDTO insert(KbQaQuestion question){
		BaseResultDTO resultDTO = new BaseResultDTO();
		question.setAcount(0);
		question.setVcount(0);
		question.setRemoved("0");
		question.setStatus("20");//ÒÑ¿ª·Å
		question.setAcount(0);
		question.setVcount(0);
		question.setUpdatetime(new Date());
		int result = kbQaQuestionMapper.insert(question);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO update(KbQaQuestion data){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = kbQaQuestionMapper.updateByPrimaryKeySelective(data);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public KbQaQuestionDTO queryList(Map<String,Object> map){
		KbQaQuestionDTO resultDTO = new KbQaQuestionDTO();
		resultDTO.setSucccess();
		int count = kbQaQuestionMapper.getCount(map);
		resultDTO.setTotal(count);
		if(count>0){
			List<KbQaQuestion> list =kbQaQuestionMapper.queryList(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			KbQaQuestion data = new KbQaQuestion();
			data.setId(new Integer(id));
			data.setRemoved("1");
			int result = kbQaQuestionMapper.updateByPrimaryKeySelective(data);
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
