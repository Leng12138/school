package com.leng.tms.service;

import com.github.pagehelper.PageInfo;
import com.leng.tms.bean.Department_Review;

public interface Department_ReviewService {

    PageInfo<Department_Review> getAllReview(int page);

    void commitReview(String no, String review, String nowtime);

}
