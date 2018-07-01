package com.forest.dto.publicservice;
import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.publicservice.ForestryPublicServiceRecord;

public class PublicServiceQueryReusltDTO extends BaseResultDTO{

	private List<ForestryPublicServiceRecord> data ;
	private Long total;

	public List<ForestryPublicServiceRecord> getData() {
		return data;
	}

	public void setData(List<ForestryPublicServiceRecord> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
