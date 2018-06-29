package com.forest.dto.logging;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;

public class LoggingPlanQueryReusltDTO extends BaseResultDTO{

	private List<ForestryLoggingPlan> data ;
	private Long total;

	public List<ForestryLoggingPlan> getData() {
		return data;
	}

	public void setData(List<ForestryLoggingPlan> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
