package com.leng.tms.controller;

import com.leng.tms.service.ChangePasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChangePasswordController {

    @Autowired
    private ChangePasswordService changePasswordService;

    @RequestMapping("/change")
    @ResponseBody
    public String changePassword(String username, String old_password, String new_password, String again_password) {
        if (!changePasswordService.selectPasswordByUsername(username).equals(old_password)) {
            return "error";
        }
        if (!new_password.equals(again_password)) {
            return "different";
        }
        changePasswordService.changePassword(username, new_password);
        return "success";
    }

    @RequestMapping("/changepassword")
    public String changepassword() {
        return "changepassword";
    }

}
