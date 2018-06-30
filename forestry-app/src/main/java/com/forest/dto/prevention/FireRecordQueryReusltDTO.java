package com.forest.dto.prevention;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

public class FireRecordQueryReusltDTO extends BaseResultDTO{

	private List<ForestryFireRecord> data ;
	private Long total;

	public List<ForestryFireRecord> getData() {
		return data;
	}

	public void setData(List<ForestryFireRecord> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
