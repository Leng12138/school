package com.leng.tms.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leng.tms.bean.Department_Review;
import com.leng.tms.dao.Department_ReviewDao;
import com.leng.tms.service.Department_ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class Department_ReviewServiceImpl implements Department_ReviewService {

    @Autowired
    private Department_ReviewDao department_reviewDao;

    @Override
    public PageInfo<Department_Review> getAllReview(int page) {
        PageHelper.startPage(page, 3);
        List<Department_Review> list = department_reviewDao.getAllReview();
        PageInfo<Department_Review> pageInfo = new PageInfo<>(list, 3);
        return pageInfo;
    }

    @Override
    public void commitReview(String no, String review, String nowtime) {
        Department_Review bak = new Department_Review();
        if (no.charAt(0) == 'S') {
            bak.setSex(department_reviewDao.selectStudentSex(no));
            bak.setRolelevel("同学");
        } else if (no.charAt(0) == 'T') {
            bak.setSex(department_reviewDao.selectTeacherSex(no));
            bak.setRolelevel("教师");
        } else {
            bak.setSex("官方");
            bak.setRolelevel("系统管理员");
        }
        bak.setNo(no);
        bak.setReview(review);
        Date time = Date.valueOf(nowtime);
        bak.setTime(time);
        department_reviewDao.commitReview(bak);
    }

}
