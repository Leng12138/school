package com.leng.tms.dao;

import com.leng.tms.domain.DepartmentReview;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentReviewDao {

    List<DepartmentReview> getAllReview();

    int commitReview(DepartmentReview departmentReview);

    String selectStudentSex(String no);

    String selectTeacherSex(String no);

}
