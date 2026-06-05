package com.footwear.dto.reports;

public class ForeignKeyInfoDTO {

    private String fkColumn;

    private String referencedTable;

    private String referencedPkColumn;

    private String displayColumn;

    public ForeignKeyInfoDTO() {

    }

    public ForeignKeyInfoDTO(String fkColumn,
                             String referencedTable,
                             String referencedPkColumn,
                             String displayColumn) {

        this.fkColumn = fkColumn;
        this.referencedTable = referencedTable;
        this.referencedPkColumn = referencedPkColumn;
        this.displayColumn = displayColumn;
    }

    public String getFkColumn() {
        return fkColumn;
    }

    public void setFkColumn(String fkColumn) {
        this.fkColumn = fkColumn;
    }

    public String getReferencedTable() {
        return referencedTable;
    }

    public void setReferencedTable(String referencedTable) {
        this.referencedTable = referencedTable;
    }

    public String getReferencedPkColumn() {
        return referencedPkColumn;
    }

    public void setReferencedPkColumn(String referencedPkColumn) {
        this.referencedPkColumn = referencedPkColumn;
    }

    public String getDisplayColumn() {
        return displayColumn;
    }

    public void setDisplayColumn(String displayColumn) {
        this.displayColumn = displayColumn;
    }
}