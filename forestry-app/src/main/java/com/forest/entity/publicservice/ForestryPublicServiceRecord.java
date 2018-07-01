package com.forest.entity.publicservice;

import java.math.BigDecimal;
import java.util.Date;

public class ForestryPublicServiceRecord {
    private Integer id;

    private Date createdAt;

    private String createdBy;

    private Date updatedAt;

    private String updatedBy;

    private Integer version;

    private String treeSpecies;

    private Date plantingTime;

    private Integer treeNum;

    private String name;

    private String contact;

    private Date donationTime;

    private BigDecimal treeUnitPrice;

    private String publicServiceName;

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
        this.createdBy = createdBy == null ? null : createdBy.trim();
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
        this.updatedBy = updatedBy == null ? null : updatedBy.trim();
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getTreeSpecies() {
        return treeSpecies;
    }

    public void setTreeSpecies(String treeSpecies) {
        this.treeSpecies = treeSpecies == null ? null : treeSpecies.trim();
    }

    public Date getPlantingTime() {
        return plantingTime;
    }

    public void setPlantingTime(Date plantingTime) {
        this.plantingTime = plantingTime;
    }

    public Integer getTreeNum() {
        return treeNum;
    }

    public void setTreeNum(Integer treeNum) {
        this.treeNum = treeNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public Date getDonationTime() {
        return donationTime;
    }

    public void setDonationTime(Date donationTime) {
        this.donationTime = donationTime;
    }

    public BigDecimal getTreeUnitPrice() {
        return treeUnitPrice;
    }

    public void setTreeUnitPrice(BigDecimal treeUnitPrice) {
        this.treeUnitPrice = treeUnitPrice;
    }

    public String getPublicServiceName() {
        return publicServiceName;
    }

    public void setPublicServiceName(String publicServiceName) {
        this.publicServiceName = publicServiceName == null ? null : publicServiceName.trim();
    }
}