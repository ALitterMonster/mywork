package com.forest.dto.park;


import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.park.ForestryPark;

public class ParkQueryReusltData extends BaseResultDTO{

	private ForestryPark data ;

	public ForestryPark getData() {
		return data;
	}

	public void setData(ForestryPark data) {
		this.data = data;
	}
	
}
