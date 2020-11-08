package com.leng.tms.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ChangePasswordDao {

    int changePassword(@Param("username") String username, @Param("new_password") String new_password);

    String selectPasswordByUsername(String username);

}
