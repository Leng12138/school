package com.leng.tms.controller;

import com.github.pagehelper.PageInfo;
import com.leng.tms.domain.DepartmentReview;
import com.leng.tms.service.DepartmentReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DepartmentReviewController {

    @Autowired
    private DepartmentReviewService departmentReviewService;

    @RequestMapping("/department_review")
    public String selectReview(Model model, int page) {
        PageInfo<DepartmentReview> pageInfo = departmentReviewService.getAllReview(page);
        model.addAttribute("pageInfo", pageInfo);
        return "department_review";
    }

    @RequestMapping("/commit")
    @ResponseBody
    public String commitReview(String username, String review, String nowtime) {
        departmentReviewService.commitReview(username, review, nowtime);
        return "success";
    }

}
