package com.forest.dto.geoinfo;

import java.util.List;

import com.forest.entity.geographic.GeogInfo;

public class GeoInfoQueryResultDTO {
	
	private int total;
	private List<GeogInfo> data ;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<GeogInfo> getData() {
		return data;
	}
	public void setData(List<GeogInfo> data) {
		this.data = data;
	}
	
	

}
