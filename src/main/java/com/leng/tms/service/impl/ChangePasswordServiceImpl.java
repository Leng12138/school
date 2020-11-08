package com.leng.tms.service.impl;

import com.leng.tms.dao.ChangePasswordDao;
import com.leng.tms.service.ChangePasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChangePasswordServiceImpl implements ChangePasswordService {

    @Autowired
    private ChangePasswordDao changePasswordDao;

    @Override
    public void changePassword(String username, String new_password) {
        changePasswordDao.changePassword(username, new_password);
    }

    @Override
    public String selectPasswordByUsername(String username) {
        return changePasswordDao.selectPasswordByUsername(username);
    }

}
