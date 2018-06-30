package com.forest.dto.logging;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;

public class LoggingPlanQueryReusltData extends BaseResultDTO{

	private ForestryLoggingPlan data ;

	public ForestryLoggingPlan getData() {
		return data;
	}

	public void setData(ForestryLoggingPlan data) {
		this.data = data;
	}
	
}
