package com.forest.dto.common;

import com.forest.enums.BaseResultEnum;

public class BaseResultDTO {

	
	private String code;
	private String message;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setSucccess(){
		this.setCode(BaseResultEnum.SUCCESS.getCode());
		this.setMessage(BaseResultEnum.SUCCESS.getMessage());
	}
	public void setError(){
		this.setCode(BaseResultEnum.ERROR.getCode());
		this.setMessage(BaseResultEnum.ERROR.getMessage());
	}
	public void setParamError(){
		this.setCode(BaseResultEnum.PARAM_ERROR.getCode());
		this.setMessage(BaseResultEnum.PARAM_ERROR.getMessage());
	}
	
}
