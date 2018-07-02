package com.forest.dto.forum;

import java.util.List;

import com.forest.dto.common.BaseResultDTO;
import com.forest.entity.forum.KbQaQuestion;
import com.forest.entity.geographic.GeogInfo;

public class KbQaQuestionDTO extends BaseResultDTO{
	
	private int total;
	private List<KbQaQuestion> data ;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<KbQaQuestion> getData() {
		return data;
	}
	public void setData(List<KbQaQuestion> data) {
		this.data = data;
	}
	
	

}
