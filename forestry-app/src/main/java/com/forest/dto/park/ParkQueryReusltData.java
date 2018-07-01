package com.forest.dto.park;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.park.ForestryPark;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

public class ParkQueryReusltData extends BaseResultDTO{

	private ForestryPark data ;

	public ForestryPark getData() {
		return data;
	}

	public void setData(ForestryPark data) {
		this.data = data;
	}
	
}
