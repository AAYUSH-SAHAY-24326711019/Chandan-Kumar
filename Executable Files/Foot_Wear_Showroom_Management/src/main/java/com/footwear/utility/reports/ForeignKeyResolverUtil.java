package com.footwear.utility.reports;

import java.util.HashMap;
import java.util.Map;

import com.footwear.dto.reports.ForeignKeyInfoDTO;

public class ForeignKeyResolverUtil {

    private static final Map<String, ForeignKeyInfoDTO> FK_MAP =
            new HashMap<>();

    static {

        FK_MAP.put(
                "item_listing_inventory.item_size",
                new ForeignKeyInfoDTO(
                        "item_size",
                        "item_size",
                        "id",
                        "foot_wear_size"));

        FK_MAP.put(
                "orders.custormer_id",
                new ForeignKeyInfoDTO(
                        "custormer_id",
                        "customer_reg",
                        "cid",
                        "cname"));

        FK_MAP.put(
                "orders.item_id",
                new ForeignKeyInfoDTO(
                        "item_id",
                        "item_listing_inventory",
                        "id",
                        "item_name"));

        FK_MAP.put(
                "customer_purchase.cid",
                new ForeignKeyInfoDTO(
                        "cid",
                        "customer_reg",
                        "cid",
                        "cname"));

        FK_MAP.put(
                "customer_purchase.item_id",
                new ForeignKeyInfoDTO(
                        "item_id",
                        "item_listing_inventory",
                        "id",
                        "item_name"));

        FK_MAP.put(
                "customer_purchase.pay_method",
                new ForeignKeyInfoDTO(
                        "pay_method",
                        "pay_status",
                        "id",
                        "pay_status"));

        FK_MAP.put(
                "customer_purchase.warr_or_exc",
                new ForeignKeyInfoDTO(
                        "warr_or_exc",
                        "warranty_status",
                        "id",
                        "warranty_status"));

        FK_MAP.put(
                "deliveries.delivery_status_id",
                new ForeignKeyInfoDTO(
                        "delivery_status_id",
                        "delivery_status",
                        "id",
                        "delivery_status"));

        FK_MAP.put(
                "deliveries.pay_status_id",
                new ForeignKeyInfoDTO(
                        "pay_status_id",
                        "pay_status",
                        "id",
                        "pay_status"));

        FK_MAP.put(
                "deliveries.item_id",
                new ForeignKeyInfoDTO(
                        "item_id",
                        "item_listing_inventory",
                        "id",
                        "item_name"));

        FK_MAP.put(
                "logistic_company.status",
                new ForeignKeyInfoDTO(
                        "status",
                        "logis_comp_contr_status",
                        "id",
                        "contract_status"));
    }

    private ForeignKeyResolverUtil() {

    }

    public static ForeignKeyInfoDTO getForeignKeyInfo(
            String tableName,
            String columnName) {

        return FK_MAP.get(
                tableName + "." + columnName);
    }
}