package com.forest.service.logging;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.entity.logging.ForestryLoggingPlan;

@Service
public class LoggingPlanService {

	@Autowired 
	private ForestryLoggingPlanMapper forestryLoggingPlanMapper;
	
	public BaseResultDTO insertPlan(ForestryLoggingPlan plan){
		plan.setCreatedAt(new Date());
		plan.setCreatedBy("sys");
		plan.setUpdatedAt(new Date());
		plan.setUpdatedBy("sys");
		plan.setVersion(1);
		plan.setIsValid("1");
		plan.setIsEnable("0");
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryLoggingPlanMapper.insert(plan);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updatePlan(ForestryLoggingPlan plan){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryLoggingPlanMapper.updateByPrimaryKeySelective(plan);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public LoggingPlanQueryReusltDTO queryList(Map<String,Object> map){
		LoggingPlanQueryReusltDTO resultDTO = new LoggingPlanQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryLoggingPlanMapper.getLoggingPlanCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryLoggingPlan> list =forestryLoggingPlanMapper.queryPlanListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
}
