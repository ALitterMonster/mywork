package com.forest.service.product;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.dao.logging.ForestryLoggingPlanMapper;
import com.forest.dao.product.ForestryProductHistoryMapper;
import com.forest.dao.product.ForestryProductInfoMapper;
import com.forest.dto.common.BaseResultDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltDTO;
import com.forest.dto.logging.LoggingPlanQueryReusltData;
import com.forest.dto.product.ProductQueryReusltDTO;
import com.forest.dto.product.ProductQueryReusltData;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingPlanCheck;
import com.forest.entity.product.ForestryProductHistory;
import com.forest.entity.product.ForestryProductInfo;

@Service
public class ProductHisService {

	@Autowired 
	private ForestryProductHistoryMapper forestryProductHistoryMapper;
	@Autowired 
	private ForestryProductInfoMapper forestryProductInfoMapper;
	
	public BaseResultDTO insert(ForestryProductHistory history){
		history.setCreatedAt(new Date());
		history.setCreatedBy("sys");
		history.setUpdatedAt(new Date());
		history.setUpdatedBy("sys");
		history.setVersion("1");
		history.setIsValid("1");
		
		BaseResultDTO resultDTO = new BaseResultDTO();
		int result = forestryProductHistoryMapper.insert(history);
		
		ForestryProductInfo product = new ForestryProductInfo();
		product.setId(history.getProductId());
		if("1".equals(history.getType())){
			product.setAmount(history.getAmount());
		}else{
			product.setAmount(history.getAmount()*(-1));
		}
		int updateResult = forestryProductInfoMapper.updateByPrimaryKeySelective(product);
		if(result>0 && updateResult>0){
			resultDTO.setSucccess();
		}else{
			resultDTO.setError();
		}
		return resultDTO;
	}
	
}
