package com.footwearshowroom.dto;

public class LogisticCompanyDTO {

    private int id;
    private String logisticCompany;
    private String contractStart;
    private String contractEndDate;
    private int statusId;
    private String statusName;

    public LogisticCompanyDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogisticCompany() {
        return logisticCompany;
    }

    public void setLogisticCompany(String logisticCompany) {
        this.logisticCompany = logisticCompany;
    }

    public String getContractStart() {
        return contractStart;
    }

    public void setContractStart(String contractStart) {
        this.contractStart = contractStart;
    }

    public String getContractEndDate() {
        return contractEndDate;
    }

    public void setContractEndDate(String contractEndDate) {
        this.contractEndDate = contractEndDate;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}