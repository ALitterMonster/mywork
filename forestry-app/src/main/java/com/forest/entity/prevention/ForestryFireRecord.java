package com.forest.entity.prevention;

import java.io.Serializable;
import java.util.Date;

public class ForestryFireRecord implements Serializable{

	
	private Integer id;
	private Date createdAt;
	private String createdBy;
	private Date updatedAt;
	private String updatedBy;
	private Integer version;
	private Date occurTime;//���ַ���ʱ��
	private String affectedArea;//���ַ�������
	private Date dealTime;//���ִ���ʱ��
	private String dealPlan;//���ִ�����
	private String longitude;//����
	private String latitude;//γ��
	private String temperature;//�¶�
	private String airHumidity;//����ʪ��
	private String windDirection;//����
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
	public Date getOccurTime() {
		return occurTime;
	}
	public void setOccurTime(Date occurTime) {
		this.occurTime = occurTime;
	}
	public String getAffectedArea() {
		return affectedArea;
	}
	public void setAffectedArea(String affectedArea) {
		this.affectedArea = affectedArea;
	}
	public Date getDealTime() {
		return dealTime;
	}
	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}
	public String getDealPlan() {
		return dealPlan;
	}
	public void setDealPlan(String dealPlan) {
		this.dealPlan = dealPlan;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getAirHumidity() {
		return airHumidity;
	}
	public void setAirHumidity(String airHumidity) {
		this.airHumidity = airHumidity;
	}
	public String getWindDirection() {
		return windDirection;
	}
	public void setWindDirection(String windDirection) {
		this.windDirection = windDirection;
	}
	
	
	
}
