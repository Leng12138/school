package com.leng.tms.dao;

import com.leng.tms.bean.Department_Review;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Department_ReviewDao {

    List<Department_Review> getAllReview();

    int commitReview(Department_Review department_review);

    String selectStudentSex(String no);

    String selectTeacherSex(String no);

}
