package com.forest.service.wetlands;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.wetlands.ForestryWetlandsMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.wetlands.WetlandsQueryReusltDTO;
import com.forest.dto.wetlands.WetlandsQueryReusltData;
import com.forest.entity.wetlands.ForestryWetlands;

@Service
public class WetlandsService {

	@Autowired 
	private ForestryWetlandsMapper forestryWetlandsMapper;

	public BaseResultDTO insertWetlands(ForestryWetlands record){
		record.setCreatedAt(new Date());
		record.setCreatedBy("sys");
		record.setUpdatedAt(new Date());
		record.setUpdatedBy("sys");
		record.setVersion(1);
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryWetlandsMapper.insert(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updateWetlands(ForestryWetlands record){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryWetlandsMapper.updateByPrimaryKeySelective(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public WetlandsQueryReusltData selectByPrimaryKey(Integer id){
		WetlandsQueryReusltData resultDTO = new WetlandsQueryReusltData();
		resultDTO.setSucccess();
		ForestryWetlands plan = forestryWetlandsMapper.selectByPrimaryKey(id);
		resultDTO.setData(plan);
		return resultDTO;
	}
	
	public WetlandsQueryReusltDTO queryList(Map<String,Object> map){
		WetlandsQueryReusltDTO resultDTO = new WetlandsQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryWetlandsMapper.getCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryWetlands> list =forestryWetlandsMapper.queryListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			int result = forestryWetlandsMapper.deleteByPrimaryKey(new Integer(id));
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
