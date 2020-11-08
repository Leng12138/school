package com.leng.tms.controller;

import com.github.pagehelper.PageInfo;
import com.leng.tms.bean.Department_Review;
import com.leng.tms.service.Department_ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Department_ReviewController {

    @Autowired
    private Department_ReviewService department_reviewService;

    @RequestMapping("/department_review")
    public String selectReview(Model model, int page) {
        PageInfo<Department_Review> pageInfo = department_reviewService.getAllReview(page);
        model.addAttribute("pageInfo", pageInfo);
        return "department_review";
    }

    @RequestMapping("/commit")
    @ResponseBody
    public String commitReview(String username, String review, String nowtime) {
        department_reviewService.commitReview(username, review, nowtime);
        return "success";
    }

}
