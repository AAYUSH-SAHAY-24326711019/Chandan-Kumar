package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.footwear.utility.DbConnection;

public class AdminDAO {

    public boolean login(String email, String password) {

        try (
            Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin_team WHERE admin_email=? AND admin_pass=?")
        ) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            return rs.next();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
}
