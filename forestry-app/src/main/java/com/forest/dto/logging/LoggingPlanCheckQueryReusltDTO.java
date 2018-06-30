package com.forest.dto.logging;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingPlanCheck;

public class LoggingPlanCheckQueryReusltDTO extends BaseResultDTO{

	private List<ForestryLoggingPlanCheck> data ;
	private Long total;

	public List<ForestryLoggingPlanCheck> getData() {
		return data;
	}

	public void setData(List<ForestryLoggingPlanCheck> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
