package com.forest.dto.logging;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.logging.ForestryLoggingRecord;

public class LoggingRecordQueryReusltDTO extends BaseResultDTO{

	private List<ForestryLoggingRecord> data ;
	private Long total;
	public List<ForestryLoggingRecord> getData() {
		return data;
	}
	public void setData(List<ForestryLoggingRecord> data) {
		this.data = data;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	
	
}
