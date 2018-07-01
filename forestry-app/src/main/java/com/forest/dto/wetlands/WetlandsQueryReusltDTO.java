package com.forest.dto.wetlands;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.wetlands.ForestryWetlands;

public class WetlandsQueryReusltDTO extends BaseResultDTO{

	private List<ForestryWetlands> data ;
	private Long total;

	public List<ForestryWetlands> getData() {
		return data;
	}

	public void setData(List<ForestryWetlands> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
