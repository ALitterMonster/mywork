package com.forest.enums;

public enum BaseResultEnum {
	
	SUCCESS("0000","成功"),
	PARAM_ERROR("0098","请求参数格式异常"),
	ERROR("0099","系统异常");
	private String code;
	private String message;
	private BaseResultEnum(String code, String message) {
		this.code = code;
		this.message = message;
	}
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
	
	

}
