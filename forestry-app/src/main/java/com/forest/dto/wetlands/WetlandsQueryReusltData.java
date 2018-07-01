package com.forest.dto.wetlands;


import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.wetlands.ForestryWetlands;

public class WetlandsQueryReusltData extends BaseResultDTO{

	private ForestryWetlands data ;

	public ForestryWetlands getData() {
		return data;
	}

	public void setData(ForestryWetlands data) {
		this.data = data;
	}
	
}
