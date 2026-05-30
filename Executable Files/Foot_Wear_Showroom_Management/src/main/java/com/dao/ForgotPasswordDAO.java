package com.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;

import com.footwear.utility.DbConnection;

public class ForgotPasswordDAO {
	 public boolean resetPassword(
	            String email,
	            int adminId,
	            String newPassword) {

	        try (
	            Connection con = DbConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(
	                    "UPDATE admin_team " +
	                    "SET admin_pass=? " +
	                    "WHERE admin_email=? AND admin_id=?")
	        ) {

	            ps.setString(1, newPassword);
	            ps.setString(2, email);
	            ps.setInt(3, adminId);

	            return ps.executeUpdate() > 0;

	        } catch (Exception e) {

	            e.printStackTrace();
	        }

	        return false;
	    }
}
