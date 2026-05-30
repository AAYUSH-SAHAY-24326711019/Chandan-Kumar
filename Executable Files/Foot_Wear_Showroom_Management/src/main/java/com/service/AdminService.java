package com.service;

import com.dao.AdminDAO;
import com.entity.Admin;

public class AdminService {

    private AdminDAO dao = new AdminDAO();

    public Admin login(String email, String password) {
        return dao.login(email, password);
    }
}