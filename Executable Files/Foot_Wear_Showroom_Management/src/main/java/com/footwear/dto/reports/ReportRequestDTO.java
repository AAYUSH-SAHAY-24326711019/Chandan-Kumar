package com.footwear.dto.reports;

import java.util.List;

public class ReportRequestDTO {

    private String tableName;

    private List<String> selectedColumns;

    private String orientation;

    private String sortColumn;

    private String sortOrder;

    private boolean allRows;

    private Integer rowLimit;

    private boolean showForeignKeys;

    public ReportRequestDTO() {

    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<String> getSelectedColumns() {
        return selectedColumns;
    }

    public void setSelectedColumns(List<String> selectedColumns) {
        this.selectedColumns = selectedColumns;
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation;
    }

    public String getSortColumn() {
        return sortColumn;
    }

    public void setSortColumn(String sortColumn) {
        this.sortColumn = sortColumn;
    }

    public String getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(String sortOrder) {
        this.sortOrder = sortOrder;
    }

    public boolean isAllRows() {
        return allRows;
    }

    public void setAllRows(boolean allRows) {
        this.allRows = allRows;
    }

    public Integer getRowLimit() {
        return rowLimit;
    }

    public void setRowLimit(Integer rowLimit) {
        this.rowLimit = rowLimit;
    }

    public boolean isShowForeignKeys() {
        return showForeignKeys;
    }

    public void setShowForeignKeys(boolean showForeignKeys) {
        this.showForeignKeys = showForeignKeys;
    }

    @Override
    public String toString() {
        return "ReportRequestDTO [tableName=" + tableName
                + ", selectedColumns=" + selectedColumns
                + ", orientation=" + orientation
                + ", sortColumn=" + sortColumn
                + ", sortOrder=" + sortOrder
                + ", allRows=" + allRows
                + ", rowLimit=" + rowLimit
                + ", showForeignKeys=" + showForeignKeys + "]";
    }
}