package com.forest.entity.logging;

import java.util.Date;

public class ForestryLoggingPlanCheck {
    private Integer id;

    private String createdAt;

    private String createdBy;

    private Date updatedAt;

    private Date updatedBy;

    private Integer planId;

    private String status;

    private String remark;

    private String isValid;

    private String version;
    
    private ForestryLoggingPlan forestryLoggingPlan;
    
    public ForestryLoggingPlan getForestryLoggingPlan() {
		return forestryLoggingPlan;
	}

	public void setForestryLoggingPlan(ForestryLoggingPlan forestryLoggingPlan) {
		this.forestryLoggingPlan = forestryLoggingPlan;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt == null ? null : createdAt.trim();
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Date getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(Date updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Integer getPlanId() {
        return planId;
    }

    public void setPlanId(Integer planId) {
        this.planId = planId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }
}