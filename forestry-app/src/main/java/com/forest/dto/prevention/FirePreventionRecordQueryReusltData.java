package com.forest.dto.prevention;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.prevention.ForestryFirePreventionRecord;

public class FirePreventionRecordQueryReusltData extends BaseResultDTO{

	private ForestryFirePreventionRecord data ;

	public ForestryFirePreventionRecord getData() {
		return data;
	}

	public void setData(ForestryFirePreventionRecord data) {
		this.data = data;
	}
	
}
