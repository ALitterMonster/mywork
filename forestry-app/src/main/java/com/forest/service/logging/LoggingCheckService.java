package com.forest.service.logging;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanCheckMapper;
import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dao.logging.ForestryLoggingRecordMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanCheckQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanCheckQueryReusltData;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.logging.LoggingRecordQueryReusltDTO;
import com.forest.dto.logging.LoggingRecordQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingPlanCheck;
import com.forest.entity.logging.ForestryLoggingRecord;

@Service
public class LoggingCheckService {

	@Autowired 
	private ForestryLoggingPlanCheckMapper forestryLoggingPlanCheckMapper;
	
	public BaseResultDTO insertRecord(ForestryLoggingPlanCheck check){
		check.setCreatedAt(new Date());
		check.setUpdatedAt(new Date());
		check.setCreatedBy("sys");
		check.setUpdatedBy("sys");
		check.setVersion("1");
		check.setIsValid("1");
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryLoggingPlanCheckMapper.insert(check);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updateReocrd(ForestryLoggingPlanCheck check){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryLoggingPlanCheckMapper.updateByPrimaryKeySelective(check);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			ForestryLoggingPlanCheck check = new ForestryLoggingPlanCheck();
			check.setId(new Integer(id));
			check.setIsValid("0");
			check.setUpdatedAt(new Date());
			int result = forestryLoggingPlanCheckMapper.updateByPrimaryKeySelective(check);
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
	
	public LoggingPlanCheckQueryReusltDTO queryList(Map<String,Object> map){
		LoggingPlanCheckQueryReusltDTO resultDTO = new LoggingPlanCheckQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryLoggingPlanCheckMapper.getLoggingPlanCheckCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryLoggingPlanCheck> list =forestryLoggingPlanCheckMapper.queryPlanCheckListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public LoggingPlanCheckQueryReusltData selectByPrimaryKey(Integer id){
		LoggingPlanCheckQueryReusltData resultDTO = new LoggingPlanCheckQueryReusltData();
		resultDTO.setSucccess();
		ForestryLoggingPlanCheck record = forestryLoggingPlanCheckMapper.selectByPrimaryKey(id);
		resultDTO.setData(record);
		return resultDTO;
	}
}
