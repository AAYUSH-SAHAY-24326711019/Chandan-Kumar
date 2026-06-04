package com.footwearshowroom.dto;

import java.util.List;

public class PaginationResponse {

    private List<LogisticCompanyDTO> data;
    private int total;

    public List<LogisticCompanyDTO> getData() {
        return data;
    }

    public void setData(List<LogisticCompanyDTO> data) {
        this.data = data;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}