package com.forest.dto.product;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.product.ForestryProductInfo;

public class ProductQueryReusltDTO extends BaseResultDTO{

	private List<ForestryProductInfo> data ;
	private Long total;
	public List<ForestryProductInfo> getData() {
		return data;
	}
	public void setData(List<ForestryProductInfo> data) {
		this.data = data;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	
	
}
