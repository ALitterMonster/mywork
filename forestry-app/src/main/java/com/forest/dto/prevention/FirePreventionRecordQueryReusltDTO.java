package com.forest.dto.prevention;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.prevention.ForestryFirePreventionRecord;

public class FirePreventionRecordQueryReusltDTO extends BaseResultDTO{

	private List<ForestryFirePreventionRecord> data ;
	private Long total;

	public List<ForestryFirePreventionRecord> getData() {
		return data;
	}

	public void setData(List<ForestryFirePreventionRecord> data) {
		this.data = data;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
}
