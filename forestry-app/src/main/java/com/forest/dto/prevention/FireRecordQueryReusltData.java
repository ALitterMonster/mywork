package com.forest.dto.prevention;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

public class FireRecordQueryReusltData extends BaseResultDTO{

	private ForestryFireRecord data ;

	public ForestryFireRecord getData() {
		return data;
	}

	public void setData(ForestryFireRecord data) {
		this.data = data;
	}
	
}
