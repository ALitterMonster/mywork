package com.forest.dto.product;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingRecord;
import com.forest.entity.product.ForestryProductInfo;

public class ProductQueryReusltData extends BaseResultDTO{

	private ForestryProductInfo data ;

	public ForestryProductInfo getData() {
		return data;
	}

	public void setData(ForestryProductInfo data) {
		this.data = data;
	}
	
}
