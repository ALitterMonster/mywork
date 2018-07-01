package com.forest.dto.publicservice;


import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.publicservice.ForestryPublicServiceRecord;

public class PublicServiceQueryReusltData extends BaseResultDTO{

	private ForestryPublicServiceRecord data ;

	public ForestryPublicServiceRecord getData() {
		return data;
	}

	public void setData(ForestryPublicServiceRecord data) {
		this.data = data;
	}
	
}
