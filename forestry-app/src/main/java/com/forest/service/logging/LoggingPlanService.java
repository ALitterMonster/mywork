package com.forest.service.logging;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanCheckMapper;
import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingPlanCheck;

@Service
public class LoggingPlanService {

	@Autowired 
	private ForestryLoggingPlanMapper forestryLoggingPlanMapper;
	@Autowired
	private ForestryLoggingPlanCheckMapper forestryLoggingPlanCheckMapper;
	
	public BaseResultDTO insertPlan(ForestryLoggingPlan plan,String username){
		plan.setCreatedAt(new Date());
		plan.setUpdatedAt(new Date());
		plan.setVersion(1);
		plan.setIsValid("1");
		plan.setIsEnable("0");
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryLoggingPlanMapper.insert(plan);
		
		ForestryLoggingPlanCheck plancheck = new ForestryLoggingPlanCheck();
		plancheck.setCreatedAt(new Date());
		plancheck.setCreatedBy(username);
		plancheck.setUpdatedAt(new Date());
		plancheck.setUpdatedBy(username);
		plancheck.setPlanId(plan.getId());
		plancheck.setStatus("2");
		plancheck.setVersion("1");
		plancheck.setIsValid("1");
		plancheck.setVersion("1");
		int checkResult = forestryLoggingPlanCheckMapper.insert(plancheck);
		if(result>0 && checkResult>0){
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
	
	public LoggingPlanQueryReusltData selectByPrimaryKey(Integer id){
		LoggingPlanQueryReusltData resultDTO = new LoggingPlanQueryReusltData();
		resultDTO.setSucccess();
		ForestryLoggingPlan plan = forestryLoggingPlanMapper.selectByPrimaryKey(id);
		resultDTO.setData(plan);
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
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			ForestryLoggingPlan plan = new ForestryLoggingPlan();
			plan.setId(new Integer(id));
			plan.setIsValid("0");
			plan.setUpdatedAt(new Date());
			int result = forestryLoggingPlanMapper.updateByPrimaryKeySelective(plan);
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
