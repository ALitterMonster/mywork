package com.forest.service.forum;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.block.ForestryBlockMapper;
import com.forest.dao.forum.KbQaAnswerMapper;
import com.forest.dao.forum.KbQaQuestionMapper;
import com.forest.dto.block.BlockQueryReusltDTO;
import com.forest.dto.block.BlockQueryReusltData;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.forum.KbQaQuestionDTO;
import com.forest.entity.block.ForestryBlock;
import com.forest.entity.forum.KbQaAnswer;
import com.forest.entity.forum.KbQaQuestion;

@Service
public class AnswerService {

	
	@Autowired
	private KbQaAnswerMapper kbQaAnswerMapper;

	public KbQaAnswer insert(KbQaAnswer answer){
		BaseResultDTO resultDTO = new BaseResultDTO();
		answer.setRemoved("0");
		int result = kbQaAnswerMapper.insert(answer);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return answer;
	}
	
	public BaseResultDTO update(KbQaAnswer data){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = kbQaAnswerMapper.updateByPrimaryKeySelective(data);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	
	public List<KbQaAnswer> queryList(Map<String,Object> map){
		List<KbQaAnswer> list =kbQaAnswerMapper.queryList(map);
		return list;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			KbQaAnswer data = new KbQaAnswer();
			data.setId(new Integer(id));
			data.setRemoved("1");
			int result = kbQaAnswerMapper.updateByPrimaryKeySelective(data);
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
