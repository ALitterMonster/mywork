package com.forest.dto.block;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.block.ForestryBlock;

public class BlockQueryReusltData extends BaseResultDTO{

	private ForestryBlock data ;

	public ForestryBlock getData() {
		return data;
	}

	public void setData(ForestryBlock data) {
		this.data = data;
	}
	
}
