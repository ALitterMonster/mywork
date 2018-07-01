package com.forest.service.publicservice;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.publicservice.ForestryPublicServiceRecordMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.publicservice.PublicServiceQueryReusltDTO;
import com.forest.dto.publicservice.PublicServiceQueryReusltData;
import com.forest.entity.publicservice.ForestryPublicServiceRecord;

@Service
public class PublicServiceService {

	@Autowired 
	private ForestryPublicServiceRecordMapper forestryPublicServiceRecordMapper;

	public BaseResultDTO insertPublicService(ForestryPublicServiceRecord record){
		record.setCreatedAt(new Date());
		record.setCreatedBy(record.getCreatedBy());
		record.setUpdatedAt(new Date());
		record.setUpdatedBy(record.getCreatedBy());
		record.setVersion(1);
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryPublicServiceRecordMapper.insert(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updatePublicService(ForestryPublicServiceRecord record){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryPublicServiceRecordMapper.updateByPrimaryKeySelective(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public PublicServiceQueryReusltData selectByPrimaryKey(Integer id){
		PublicServiceQueryReusltData resultDTO = new PublicServiceQueryReusltData();
		resultDTO.setSucccess();
		ForestryPublicServiceRecord plan = forestryPublicServiceRecordMapper.selectByPrimaryKey(id);
		resultDTO.setData(plan);
		return resultDTO;
	}
	
	public PublicServiceQueryReusltDTO queryList(Map<String,Object> map){
		PublicServiceQueryReusltDTO resultDTO = new PublicServiceQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryPublicServiceRecordMapper.getCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryPublicServiceRecord> list =forestryPublicServiceRecordMapper.queryListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			ForestryPublicServiceRecord record = new ForestryPublicServiceRecord();
			record.setId(new Integer(id));
			record.setUpdatedAt(new Date());
			int result = forestryPublicServiceRecordMapper.deleteByPrimaryKey(record.getId());
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
