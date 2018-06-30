package com.forest.dto.logging;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingPlanCheck;
import com.forest.entity.logging.ForestryLoggingRecord;

public class LoggingPlanCheckQueryReusltData extends BaseResultDTO{

	private ForestryLoggingPlanCheck data ;

	public ForestryLoggingPlanCheck getData() {
		return data;
	}

	public void setData(ForestryLoggingPlanCheck data) {
		this.data = data;
	}
	
}
