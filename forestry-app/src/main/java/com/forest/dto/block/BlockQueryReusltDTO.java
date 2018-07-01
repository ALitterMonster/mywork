package com.forest.dto.block;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.block.ForestryBlock;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.park.ForestryPark;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

public class BlockQueryReusltDTO extends BaseResultDTO{

	private List<ForestryBlock> data ;
	private Long total;

	public List<ForestryBlock> getData() {
		return data;
	}

	public void setData(List<ForestryBlock> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
