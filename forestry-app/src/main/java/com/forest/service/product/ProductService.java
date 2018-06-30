package com.forest.service.product;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dao.product.ForestryProductInfoMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.product.ProductQueryReusltDTO;
import com.forest.dto.product.ProductQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingPlanCheck;
import com.forest.entity.product.ForestryProductInfo;

@Service
public class ProductService {

	@Autowired 
	private ForestryProductInfoMapper forestryProductInfoMapper;
	
	public BaseResultDTO insert(ForestryProductInfo product){
		product.setCreatedAt(new Date());
		product.setCreatedBy("sys");
		product.setUpdatedAt(new Date());
		product.setUpdatedBy("sys");
		product.setVersion(1);
		product.setIsValid("1");
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryProductInfoMapper.insert(product);
		
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public BaseResultDTO update(ForestryProductInfo dto){
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryProductInfoMapper.updateByPrimaryKeySelective(dto);
		if(result>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
	public ProductQueryReusltData selectByPrimaryKey(Integer id){
		ProductQueryReusltData resultDTO = new ProductQueryReusltData();
		resultDTO.setSucccess();
		ForestryProductInfo dto = forestryProductInfoMapper.selectByPrimaryKey(id);
		resultDTO.setData(dto);
		return resultDTO;
	}
	public ProductQueryReusltDTO queryList(Map<String,Object> map){
		ProductQueryReusltDTO resultDTO = new ProductQueryReusltDTO();
		resultDTO.setSucccess();
		int count = forestryProductInfoMapper.getProductCount(map);
		resultDTO.setTotal(new Long(count));
		if(count>0){
			List<ForestryProductInfo> list =forestryProductInfoMapper.queryListPage(map);
			resultDTO.setData(list);
		}
		return resultDTO;
	}
	
	public BaseResultDTO batchDelete(String ids){
		BaseResultDTO resultDTO = new BaseResultDTO();
		resultDTO.setSucccess();
		String[] idsList = ids.split(",");
		for(String id :idsList){
			ForestryProductInfo dto = new ForestryProductInfo();
			dto.setId(new Integer(id));
			dto.setIsValid("0");
			dto.setUpdatedAt(new Date());
			int result = forestryProductInfoMapper.updateByPrimaryKeySelective(dto);
			if(result==0){
				resultDTO.setError();
				return resultDTO;
			}
		}
		return resultDTO;
	}
}
