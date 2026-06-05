package com.footwear.service.reports;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.footwear.dto.reports.ForeignKeyInfoDTO;
import com.footwear.dto.reports.ReportRequestDTO;
import com.footwear.utility.DbConnection;
import com.footwear.utility.reports.ForeignKeyResolverUtil;

public class ReportService {

    public List<String> getAllTables() throws Exception {

        List<String> tables = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {

            DatabaseMetaData metaData = con.getMetaData();

            ResultSet rs = metaData.getTables(
                    null,
                    "public",
                    "%",
                    new String[] { "TABLE" });

            while (rs.next()) {

                String tableName = rs.getString("TABLE_NAME");

                if (!tableName.startsWith("pg_")
                        && !tableName.startsWith("sql_")) {

                    tables.add(tableName);
                }
            }
        }

        return tables;
    }

    public List<String> getColumns(String tableName)
            throws Exception {

        List<String> columns = new ArrayList<>();

        try (Connection con = DbConnection.getConnection()) {

            DatabaseMetaData metaData = con.getMetaData();

            ResultSet rs = metaData.getColumns(
                    null,
                    "public",
                    tableName,
                    "%");

            while (rs.next()) {

                columns.add(
                        rs.getString("COLUMN_NAME"));
            }
        }

        return columns;
    }

    public List<Map<String, Object>> getReportData(
            ReportRequestDTO request)
            throws Exception {

        List<Map<String, Object>> result =
                new ArrayList<>();

        StringBuilder sql = new StringBuilder();

        sql.append("SELECT ");

        for (int i = 0;
             i < request.getSelectedColumns().size();
             i++) {

            sql.append(
                    request.getSelectedColumns().get(i));

            if (i
                    < request.getSelectedColumns().size()
                            - 1) {

                sql.append(",");
            }
        }

        sql.append(" FROM ")
                .append(request.getTableName());

        if (request.getSortColumn() != null
                && !request.getSortColumn().isBlank()) {

            sql.append(" ORDER BY ")
                    .append(request.getSortColumn())
                    .append(" ")
                    .append(request.getSortOrder());
        }

        if (!request.isAllRows()
                && request.getRowLimit() != null) {

            sql.append(" LIMIT ?");
        }

        try (Connection con =
                     DbConnection.getConnection();

             PreparedStatement ps =
                     con.prepareStatement(
                             sql.toString())) {

            if (!request.isAllRows()
                    && request.getRowLimit() != null) {

                ps.setInt(
                        1,
                        request.getRowLimit());
            }

            ResultSet rs = ps.executeQuery();

            ResultSetMetaData rsmd =
                    rs.getMetaData();

            while (rs.next()) {

                Map<String, Object> row =
                        new LinkedHashMap<>();

                for (int i = 1;
                     i <= rsmd.getColumnCount();
                     i++) {

                    String column =
                            rsmd.getColumnName(i);

                    Object value =
                            rs.getObject(i);

                    if (request.isShowForeignKeys()) {

                        value =
                                resolveForeignKeyValue(
                                        request
                                                .getTableName(),
                                        column,
                                        value);
                    }

                    row.put(column, value);
                }

                result.add(row);
            }
        }

        return result;
    }

    private Object resolveForeignKeyValue(
            String tableName,
            String columnName,
            Object value)
            throws Exception {

        if (value == null) {
            return null;
        }

        ForeignKeyInfoDTO fkInfo =
                ForeignKeyResolverUtil
                        .getForeignKeyInfo(
                                tableName,
                                columnName);

        if (fkInfo == null) {
            return value;
        }

        String sql =
                "SELECT "
                        + fkInfo.getDisplayColumn()
                        + " FROM "
                        + fkInfo.getReferencedTable()
                        + " WHERE "
                        + fkInfo
                                .getReferencedPkColumn()
                        + " = ?";

        try (Connection con =
                     DbConnection.getConnection();

             PreparedStatement ps =
                     con.prepareStatement(sql)) {

            ps.setObject(1, value);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                return rs.getObject(
                        fkInfo.getDisplayColumn());
            }
        }

        return value;
    }
}