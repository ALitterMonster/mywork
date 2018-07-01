package com.forest.dto.park;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.park.ForestryPark;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

public class ParkQueryReusltDTO extends BaseResultDTO{

	private List<ForestryPark> data ;
	private Long total;

	public List<ForestryPark> getData() {
		return data;
	}

	public void setData(List<ForestryPark> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
