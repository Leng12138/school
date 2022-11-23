package com.leng.tms.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leng.tms.domain.DepartmentReview;
import com.leng.tms.dao.DepartmentReviewDao;
import com.leng.tms.service.DepartmentReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class DepartmentReviewServiceImpl implements DepartmentReviewService {

    @Autowired
    private DepartmentReviewDao departmentReviewDao;

    @Override
    public PageInfo<DepartmentReview> getAllReview(int page) {
        PageHelper.startPage(page, 3);
        List<DepartmentReview> list = departmentReviewDao.getAllReview();
        return new PageInfo<>(list, 3);
    }

    @Override
    public void commitReview(String no, String review, String nowtime) {
        DepartmentReview bak = new DepartmentReview();
        if (no.charAt(0) == 'S') {
            bak.setSex(departmentReviewDao.selectStudentSex(no));
            bak.setRolelevel("同学");
        } else if (no.charAt(0) == 'T') {
            bak.setSex(departmentReviewDao.selectTeacherSex(no));
            bak.setRolelevel("教师");
        } else {
            bak.setSex("官方");
            bak.setRolelevel("系统管理员");
        }
        bak.setNo(no);
        bak.setReview(review);
        Date time = Date.valueOf(nowtime);
        bak.setTime(time);
        departmentReviewDao.commitReview(bak);
    }

}
