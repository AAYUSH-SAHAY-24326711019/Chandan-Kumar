package com.service;

import com.dao.ForgotPasswordDAO;

public class ForgotPasswordService {

    private ForgotPasswordDAO dao =
            new ForgotPasswordDAO();

    public boolean resetPassword(
            String email,
            int adminId,
            String newPassword) {

        return dao.resetPassword(
                email,
                adminId,
                newPassword);
    }
}