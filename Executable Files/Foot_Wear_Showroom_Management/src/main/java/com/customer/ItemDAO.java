package com.customer;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.footwear.utility.DbConnection;

public class ItemDAO {

    public List<Item> getAllItems() {

        List<Item> items = new ArrayList<>();

        String sql =
                "SELECT i.id, i.item_name, i.item_size, " +
                "i.image_url, i.quantity, p.price " +
                "FROM item_listing_inventory i " +
                "LEFT JOIN price_listing_inventory p " +
                "ON i.id = p.item_id " +
                "WHERE i.quantity > 0 " +
                "ORDER BY i.id DESC";

        try (
                Connection conn = DbConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
        ) {

            while (rs.next()) {

                Item item = new Item();

                item.setId(rs.getInt("id"));
                item.setItemName(rs.getString("item_name"));
                item.setItemSize(rs.getString("item_size"));
                item.setImageUrl(rs.getString("image_url"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));

                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
    
    public List<Item> getPurchasedItems(int customerId) {

        List<Item> items = new ArrayList<>();

        String sql =
        		"SELECT "
        				+" i.id,"
        				+"i.item_name,"
        				+"i.item_size,"
        				+"i.image_url,"
        				+"p.price,"
        				+"cp.amount_paid,"
        				+"cp.purchase_date "
        				+"FROM customer_purchase cp "
        				+"JOIN item_listing_inventory i "
        				+"ON cp.item_id = i.id "
        				+"LEFT JOIN price_listing_inventory p "
        				+"ON p.item_id = i.id "
        				+"WHERE cp.cid = ? "
        				+"ORDER BY cp.purchase_date DESC";
        try (
            Connection conn = DbConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, customerId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Item item = new Item();

                item.setId(rs.getInt("id"));
                item.setItemName(rs.getString("item_name"));
                item.setItemSize(rs.getString("item_size"));
                item.setImageUrl(rs.getString("image_url"));
                item.setPrice(rs.getDouble("price"));
                item.setAmountPaid(rs.getDouble("amount_paid"));

                if(rs.getTimestamp("purchase_date") != null){
                    item.setPurchaseDate(
                        rs.getTimestamp("purchase_date").toString()
                    );
                }

                items.add(item);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}
