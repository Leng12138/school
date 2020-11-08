package com.leng.tms.service;

public interface ChangePasswordService {

    void changePassword(String username, String new_password);

    String selectPasswordByUsername(String username);

}
