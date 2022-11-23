package com.leng.tms.service;

import com.leng.tms.domain.Users;

public interface UserService {

    Users selectUser(String username);

    boolean login(Users user);

    boolean registe(Users user);

    boolean check(String no);

}

