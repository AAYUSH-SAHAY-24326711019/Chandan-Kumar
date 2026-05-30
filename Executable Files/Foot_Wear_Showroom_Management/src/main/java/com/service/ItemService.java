package com.service;

import com.dao.ItemDAO;
import com.entity.Item;

public class ItemService {

    private ItemDAO dao = new ItemDAO();

    public boolean addItem(Item item) {

        return dao.addItem(item);

    }
}