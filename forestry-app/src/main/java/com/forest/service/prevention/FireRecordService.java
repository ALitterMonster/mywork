package com.forest.service.prevention;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dao.prevention.ForestryFirePreventionRecordMapper;
import com.forest.dao.prevention.ForestryFireRecordMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.prevention.FirePreventionRecordQueryReusltDTO;
import com.forest.dto.prevention.FirePreventionRecordQueryReusltData;
import com.forest.dto.prevention.FireRecordQueryReusltDTO;
import com.forest.dto.prevention.FireRecordQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

@Service
public class FireRecordService {

	@Autowired 
	private ForestryFireRecordMapper forestryFireRecordMapper;

	public BaseResultDTO insertForestryFireRecord(ForestryFireRecord record){
		record.setCreatedAt(new Date());
		record.setCreatedBy("sys");
		record.setUpdatedAt(new Date());
		record.setUpdatedBy("sys");
		record.setVersion(1);
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryFireRecordMapper.insert(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updateForestryFireRecord(ForestryFireRecord record){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryFireRecordMapper.updateByPrimaryKeySelective(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public FireRecordQueryReusltData selectByPrimaryKey(Integer id){
		FireRecordQueryReusltData resultDTO = new FireRecordQueryReusltData();
		resultDTO.setSucccess();
		ForestryFireRecord plan = forestryFireRecordMapper.selectByPrimaryKey(id);
		resultDTO.setData(plan);
		return resultDTO;
	}
	public FireRecordQueryReusltDTO queryList(Map<String,Object> map){
		FireRecordQueryReusltDTO resultDTO = new FireRecordQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryFireRecordMapper.getFireRecordCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryFireRecord> list =forestryFireRecordMapper.queryRecordListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			int result = forestryFireRecordMapper.deleteByPrimaryKey(new Integer(id));
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
