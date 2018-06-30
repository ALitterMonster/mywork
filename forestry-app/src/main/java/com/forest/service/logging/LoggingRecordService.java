package com.forest.service.logging;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dao.logging.ForestryLoggingRecordMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.logging.LoggingRecordQueryReusltDTO;
import com.forest.dto.logging.LoggingRecordQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingRecord;

@Service
public class LoggingRecordService {

	@Autowired 
	private ForestryLoggingRecordMapper forestryLoggingRecordMapper;
	
	public BaseResultDTO insertRecord(ForestryLoggingRecord record){
		record.setCreatedAt(new Date());
		record.setUpdatedBy("sys");
		record.setVersion(new Integer(1));
		record.setIsValid("1");
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryLoggingRecordMapper.insert(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updateReocrd(ForestryLoggingRecord plan){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryLoggingRecordMapper.updateByPrimaryKeySelective(plan);
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
			ForestryLoggingRecord plan = new ForestryLoggingRecord();
			plan.setId(new Integer(id));
			plan.setIsValid("0");
			plan.setUpdatedAt(new Date());
			int result = forestryLoggingRecordMapper.updateByPrimaryKeySelective(plan);
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
	
	public LoggingRecordQueryReusltDTO queryList(Map<String,Object> map){
		LoggingRecordQueryReusltDTO resultDTO = new LoggingRecordQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryLoggingRecordMapper.getLoggingRecordCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryLoggingRecord> list =forestryLoggingRecordMapper.queryRecordListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public LoggingRecordQueryReusltData selectByPrimaryKey(Integer id){
		LoggingRecordQueryReusltData resultDTO = new LoggingRecordQueryReusltData();
		resultDTO.setSucccess();
		ForestryLoggingRecord record = forestryLoggingRecordMapper.selectByPrimaryKey(id);
		resultDTO.setData(record);
		return resultDTO;
	}
}
