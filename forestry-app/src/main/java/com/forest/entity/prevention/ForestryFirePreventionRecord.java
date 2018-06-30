package com.forest.entity.prevention;

import java.io.Serializable;
import java.util.Date;

public class ForestryFirePreventionRecord implements Serializable{

	
	private Integer id;
	private Date createdAt;
	private String createdBy;
	private Date updatedAt;
	private String updatedBy;
	private Integer version;
	private String preventionArea;//»ğÔÖÔ¤·ÀÇøÓò
	private Date preventionTime;//»ğÔÖÔ¤·ÀÊ±¼ä
	private String preventionResult;//»ğÔÖÔ¤·À½á¹û
	private String riskLevel;//·çÏÕµÈ¼¶
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getPreventionArea() {
		return preventionArea;
	}
	public void setPreventionArea(String preventionArea) {
		this.preventionArea = preventionArea;
	}
	public Date getPreventionTime() {
		return preventionTime;
	}
	public void setPreventionTime(Date preventionTime) {
		this.preventionTime = preventionTime;
	}
	public String getPreventionResult() {
		return preventionResult;
	}
	public void setPreventionResult(String preventionResult) {
		this.preventionResult = preventionResult;
	}
	public String getRiskLevel() {
		return riskLevel;
	}
	public void setRiskLevel(String riskLevel) {
		this.riskLevel = riskLevel;
	}
	
	
	
}
