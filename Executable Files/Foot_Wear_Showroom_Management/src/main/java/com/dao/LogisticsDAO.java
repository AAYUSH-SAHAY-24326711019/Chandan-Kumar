package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.footwearshowroom.dto.ContractStatusDTO;
import com.footwearshowroom.dto.LogisticCompanyDTO;
import com.footwear.utility.*;

public class LogisticsDAO {

    // ================= ADD =================

    public boolean addLogistic(LogisticCompanyDTO dto) {

        String sql = """
                INSERT INTO logistic_company
                (logistic_company, contract_start, contract_end_date, status)
                VALUES (?, ?, ?, ?)
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, dto.getLogisticCompany());
            ps.setDate(2, java.sql.Date.valueOf(dto.getContractStart()));
            ps.setDate(3, java.sql.Date.valueOf(dto.getContractEndDate()));
            ps.setInt(4, dto.getStatusId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ================= UPDATE =================

    public boolean updateLogistic(LogisticCompanyDTO dto) {

        String sql = """
                UPDATE logistic_company
                SET logistic_company=?,
                    contract_start=?,
                    contract_end_date=?,
                    status=?
                WHERE id=?
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, dto.getLogisticCompany());
            ps.setDate(2, java.sql.Date.valueOf(dto.getContractStart()));
            ps.setDate(3, java.sql.Date.valueOf(dto.getContractEndDate()));
            ps.setInt(4, dto.getStatusId());
            ps.setInt(5, dto.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ================= DELETE =================

    public boolean deleteLogistic(int id) {

        String sql = "DELETE FROM logistic_company WHERE id=?";

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ================= GET BY ID =================

    public LogisticCompanyDTO getById(int id) {

        LogisticCompanyDTO dto = null;

        String sql = """
                SELECT id,
                       logistic_company,
                       contract_start,
                       contract_end_date,
                       status
                FROM logistic_company
                WHERE id=?
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                dto = new LogisticCompanyDTO();

                dto.setId(rs.getInt("id"));
                dto.setLogisticCompany(rs.getString("logistic_company"));
                dto.setContractStart(rs.getDate("contract_start").toString());
                dto.setContractEndDate(rs.getDate("contract_end_date").toString());
                dto.setStatusId(rs.getInt("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
    
    // ================= STATUS DROPDOWN =================

    public List<ContractStatusDTO> getAllStatuses() {

        List<ContractStatusDTO> list = new ArrayList<>();

        String sql = """
                SELECT id, contract_status
                FROM logis_comp_contr_status
                ORDER BY id
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                ContractStatusDTO dto = new ContractStatusDTO();

                dto.setId(rs.getInt("id"));
                dto.setContractStatus(rs.getString("contract_status"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= PAGINATION + SEARCH =================

    public List<LogisticCompanyDTO> getLogistics(
            int offset,
            int limit,
            String search) {

        List<LogisticCompanyDTO> list = new ArrayList<>();

        String sql = """
                SELECT lc.id,
                       lc.logistic_company,
                       lc.contract_start,
                       lc.contract_end_date,
                       s.contract_status
                FROM logistic_company lc
                JOIN logis_comp_contr_status s
                ON lc.status = s.id
                WHERE LOWER(lc.logistic_company)
                LIKE LOWER(?)
                ORDER BY lc.id DESC
                LIMIT ? OFFSET ?
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + search + "%");
            ps.setInt(2, limit);
            ps.setInt(3, offset);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                LogisticCompanyDTO dto =
                        new LogisticCompanyDTO();

                dto.setId(rs.getInt("id"));
                dto.setLogisticCompany(
                        rs.getString("logistic_company"));
                dto.setContractStart(
                        rs.getDate("contract_start").toString());
                dto.setContractEndDate(
                        rs.getDate("contract_end_date").toString());
                dto.setStatusName(
                        rs.getString("contract_status"));

                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= TOTAL RECORDS =================

    public int getTotalCount(String search) {

        String sql = """
                SELECT COUNT(*)
                FROM logistic_company
                WHERE LOWER(logistic_company)
                LIKE LOWER(?)
                """;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + search + "%");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
