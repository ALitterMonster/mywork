package com.forest.entity.park;

import java.io.Serializable;
import java.util.Date;

public class ForestryPark implements Serializable{
    private Integer id;

    private Date createdAt;

    private String createdBy;

    private Date updatedAt;

    private String updatedBy;

    private Integer version;

    private String periodStart;

    private String periodEnd;

    private String passengerFlow;

    private String vegetationCoverage;

    private String animalSpecies;

    private String plantSpecies;

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

    public String getPeriodStart() {
        return periodStart;
    }

    public void setPeriodStart(String periodStart) {
        this.periodStart = periodStart == null ? null : periodStart.trim();
    }

    public String getPeriodEnd() {
        return periodEnd;
    }

    public void setPeriodEnd(String periodEnd) {
        this.periodEnd = periodEnd == null ? null : periodEnd.trim();
    }

    public String getPassengerFlow() {
        return passengerFlow;
    }

    public void setPassengerFlow(String passengerFlow) {
        this.passengerFlow = passengerFlow == null ? null : passengerFlow.trim();
    }

    public String getVegetationCoverage() {
        return vegetationCoverage;
    }

    public void setVegetationCoverage(String vegetationCoverage) {
        this.vegetationCoverage = vegetationCoverage == null ? null : vegetationCoverage.trim();
    }

    public String getAnimalSpecies() {
        return animalSpecies;
    }

    public void setAnimalSpecies(String animalSpecies) {
        this.animalSpecies = animalSpecies == null ? null : animalSpecies.trim();
    }

    public String getPlantSpecies() {
        return plantSpecies;
    }

    public void setPlantSpecies(String plantSpecies) {
        this.plantSpecies = plantSpecies == null ? null : plantSpecies.trim();
    }
}
