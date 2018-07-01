package com.forest.service.block;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.block.ForestryBlockMapper;
import com.forest.dto.block.BlockQueryReusltDTO;
import com.forest.dto.block.BlockQueryReusltData;
import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.block.ForestryBlock;

@Service
public class BlockService {

	@Autowired 
	private ForestryBlockMapper forestryBlockMapper;

	public BaseResultDTO insertBlock(ForestryBlock record){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryBlockMapper.insert(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO updateBlock(ForestryBlock record){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryBlockMapper.updateByPrimaryKey(record);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BlockQueryReusltData selectByPrimaryKey(Integer id){
		BlockQueryReusltData resultDTO = new BlockQueryReusltData();
		resultDTO.setSucccess();
		ForestryBlock plan = forestryBlockMapper.selectByPrimaryKey(id);
		resultDTO.setData(plan);
		return resultDTO;
	}
	
	public BlockQueryReusltDTO queryList(Map<String,Object> map){
		BlockQueryReusltDTO resultDTO = new BlockQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryBlockMapper.getCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryBlock> list =forestryBlockMapper.queryListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			ForestryBlock record = new ForestryBlock();
			record.setId(new Integer(id));
			int result = forestryBlockMapper.deleteByPrimaryKey(record.getId());
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
