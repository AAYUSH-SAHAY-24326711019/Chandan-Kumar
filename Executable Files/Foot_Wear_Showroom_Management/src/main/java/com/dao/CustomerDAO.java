package com.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.customer.Customer;
import com.footwear.utility.DbConnection;

public class CustomerDAO {

    public Customer login(int cid, String mobile) {

        Customer customer = null;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "SELECT cid,cname,cmobile "
                       + "FROM customer_reg "
                       + "WHERE cid=? AND cmobile=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, cid);
            ps.setString(2, mobile);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                customer = new Customer();

                customer.setCid(rs.getInt("cid"));
                customer.setCname(rs.getString("cname"));
                customer.setCmobile(rs.getString("cmobile"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return customer;
    }
    
    public Customer registerCustomer(String cname, String mobile) {

        Customer customer = null;

        try {

            Connection con = DbConnection.getConnection();

            String sql =
                "INSERT INTO customer_reg(cname, cmobile) " +
                "VALUES (?, ?) RETURNING cid";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cname);
            ps.setString(2, mobile);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                customer = new Customer();

                customer.setCid(rs.getInt("cid"));
                customer.setCname(cname);
                customer.setCmobile(mobile);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return customer;
    }
}