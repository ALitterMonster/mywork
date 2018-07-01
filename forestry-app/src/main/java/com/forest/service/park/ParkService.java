package com.forest.service.park;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dao.park.ForestryParkMapper;
import com.forest.dao.prevention.ForestryFirePreventionRecordMapper;
import com.forest.dao.prevention.ForestryFireRecordMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.park.ParkQueryReusltDTO;
import com.forest.dto.park.ParkQueryReusltData;
import com.forest.dto.prevention.FirePreventionRecordQueryReusltDTO;
import com.forest.dto.prevention.FirePreventionRecordQueryReusltData;
import com.forest.dto.prevention.FireRecordQueryReusltDTO;
import com.forest.dto.prevention.FireRecordQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.park.ForestryPark;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

@Service
public class ParkService {

	@Autowired 
	private ForestryParkMapper forestryParkMapper;

	public BaseResultDTO insertPark(ForestryPark record){
		record.setCreatedAt(new Date());
		record.setCreatedBy("sys");
		record.setUpdatedAt(new Date());
		record.setUpdatedBy("sys");
		record.setVersion(1);
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryParkMapper.insert(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updatePark(ForestryPark record){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryParkMapper.updateByPrimaryKeySelective(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public ParkQueryReusltData selectByPrimaryKey(Integer id){
		ParkQueryReusltData resultDTO = new ParkQueryReusltData();
		resultDTO.setSucccess();
		ForestryPark plan = forestryParkMapper.selectByPrimaryKey(id);
		resultDTO.setData(plan);
		return resultDTO;
	}
	public ParkQueryReusltDTO queryList(Map<String,Object> map){
		ParkQueryReusltDTO resultDTO = new ParkQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryParkMapper.getCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryPark> list =forestryParkMapper.queryListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			ForestryPark record = new ForestryPark();
			record.setId(new Integer(id));
			record.setUpdatedAt(new Date());
			int result = forestryParkMapper.updateByPrimaryKeySelective(record);
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
