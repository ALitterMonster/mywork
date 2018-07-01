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
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.prevention.ForestryFirePreventionRecord;

@Service
public class FirePreventionRecordService {

	@Autowired 
	private ForestryFirePreventionRecordMapper forestryFirePreventionRecordMapper;

	public BaseResultDTO insertForestryFirePreventionRecord(ForestryFirePreventionRecord record){
		record.setCreatedAt(new Date());
		record.setCreatedBy("sys");
		record.setUpdatedAt(new Date());
		record.setUpdatedBy("sys");
		record.setVersion(1);
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryFirePreventionRecordMapper.insert(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updateForestryFirePreventionRecord(ForestryFirePreventionRecord record){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryFirePreventionRecordMapper.updateByPrimaryKeySelective(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public FirePreventionRecordQueryReusltData selectByPrimaryKey(Integer id){
		FirePreventionRecordQueryReusltData resultDTO = new FirePreventionRecordQueryReusltData();
		resultDTO.setSucccess();
		ForestryFirePreventionRecord plan = forestryFirePreventionRecordMapper.selectByPrimaryKey(id);
		resultDTO.setData(plan);
		return resultDTO;
	}
	public FirePreventionRecordQueryReusltDTO queryList(Map<String,Object> map){
		FirePreventionRecordQueryReusltDTO resultDTO = new FirePreventionRecordQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryFirePreventionRecordMapper.getFirePreventionRecordCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryFirePreventionRecord> list =forestryFirePreventionRecordMapper.queryRecordListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			int result = forestryFirePreventionRecordMapper.deleteByPrimaryKey(new Integer(id));
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
