package com.forest.dto.logging;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingRecord;

public class LoggingRecordQueryReusltData extends BaseResultDTO{

	private ForestryLoggingRecord data ;

	public ForestryLoggingRecord getData() {
		return data;
	}

	public void setData(ForestryLoggingRecord data) {
		this.data = data;
	}
	
}
