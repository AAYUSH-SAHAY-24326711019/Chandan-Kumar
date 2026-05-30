package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Item;
import com.footwear.utility.DbConnection;

public class ItemDAO {

    public boolean addItem(Item item) {

        Connection conn = null;

        try {

            conn = DbConnection.getConnection();

            conn.setAutoCommit(false);

            String insertInventory =
                    "insert into item_listing_inventory "
                    + "(item_name, item_size, image_url, quantity) "
                    + "values (?, ?, ?, ?) returning id";

            PreparedStatement ps1 =
                    conn.prepareStatement(insertInventory);

            ps1.setString(1, item.getItemName());
            ps1.setInt(2, item.getItemSize());
            ps1.setString(3, item.getImageUrl());
            ps1.setInt(4, item.getQuantity());

            ResultSet rs = ps1.executeQuery();

            int itemId = 0;

            if (rs.next()) {

                itemId = rs.getInt("id");

            }

            String insertPrice =
                    "insert into price_listing_inventory "
                    + "(item_id, price) "
                    + "values (?, ?)";

            PreparedStatement ps2 =
                    conn.prepareStatement(insertPrice);

            ps2.setInt(1, itemId);
            ps2.setDouble(2, item.getPrice());

            ps2.executeUpdate();

            conn.commit();

            rs.close();
            ps1.close();
            ps2.close();
            conn.close();

            return true;

        } catch (Exception e) {

            try {

                if (conn != null) {
                    conn.rollback();
                }

            } catch (Exception ex) {

                ex.printStackTrace();

            }

            e.printStackTrace();
        }

        return false;
    }
}