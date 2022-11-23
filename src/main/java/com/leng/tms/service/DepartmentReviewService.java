package com.leng.tms.service;

import com.github.pagehelper.PageInfo;
import com.leng.tms.domain.DepartmentReview;

public interface DepartmentReviewService {

    PageInfo<DepartmentReview> getAllReview(int page);

    void commitReview(String no, String review, String nowtime);

}
