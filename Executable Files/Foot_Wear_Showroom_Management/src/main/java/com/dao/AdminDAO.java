package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.footwear.utility.DbConnection;
import com.entity.*;

public class AdminDAO {

    public Admin login(String email, String password) {

        try (
            Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin_team WHERE admin_email=? AND admin_pass=?")
        ) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                Admin admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setAdminType(rs.getString("admin_type"));
                admin.setAdminEmail(rs.getString("admin_email"));
                admin.setAdminPass(rs.getString("admin_pass"));
                admin.setDateCreated(rs.getTimestamp("date_created"));

                return admin;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}
