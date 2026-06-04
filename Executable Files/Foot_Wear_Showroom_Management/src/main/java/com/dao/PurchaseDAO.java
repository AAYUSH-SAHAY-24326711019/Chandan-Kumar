package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.footwear.utility.DbConnection;

public class PurchaseDAO {

    public boolean purchaseItem(int customerId, int itemId,double amountPaid) {

        Connection conn = null;

        try {

            conn = DbConnection.getConnection();
            conn.setAutoCommit(false);

            String orderSql =
                    "INSERT INTO orders " +
                    "(order_date,item_id,custormer_id) " +
                    "VALUES (CURRENT_TIMESTAMP,?,?)";

            PreparedStatement orderPs =
                    conn.prepareStatement(orderSql);

            orderPs.setInt(1, itemId);
            orderPs.setInt(2, customerId);

            orderPs.executeUpdate();

            int priceId = 0;

            String priceSql =
                    "SELECT id " +
                    "FROM price_listing_inventory " +
                    "WHERE item_id=? " +
                    "LIMIT 1";

            PreparedStatement pricePs =
                    conn.prepareStatement(priceSql);

            pricePs.setInt(1, itemId);

            ResultSet rs = pricePs.executeQuery();

            if (rs.next()) {
                priceId = rs.getInt("id");
            }

            String purchaseSql =
            	    "INSERT INTO customer_purchase " +
            	    "(cid,item_id,pid,pay_method,warr_or_exc,amount_paid) " +
            	    "VALUES (?,?,?,?,?,?)";

            PreparedStatement purchasePs =
                    conn.prepareStatement(purchaseSql);

            purchasePs.setInt(1, customerId);
            purchasePs.setInt(2, itemId);
            purchasePs.setInt(3, priceId);
            purchasePs.setInt(4, 2);
            purchasePs.setInt(5, 1);
            purchasePs.setDouble(6, amountPaid);

            purchasePs.executeUpdate();

            String updateSql =
                    "UPDATE item_listing_inventory " +
                    "SET quantity = quantity - 1 " +
                    "WHERE id=? AND quantity > 0";

            PreparedStatement updatePs =
                    conn.prepareStatement(updateSql);

            updatePs.setInt(1, itemId);

            int rows = updatePs.executeUpdate();

            if (rows > 0) {

                conn.commit();

                return true;
            }

            conn.rollback();

        } catch (Exception e) {

            e.printStackTrace();

            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return false;
    }
}