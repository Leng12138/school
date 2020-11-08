package com.leng.tms.service;

import com.leng.tms.bean.Students;
import com.leng.tms.bean.Teachers;

import java.util.List;

public interface BasicMessageService {

    Students getBasicMessageByStudent(String no);

    void updateStudent(String no, String name, int age, String sex, String stuclass, String dormitory);

    Teachers getBasicMessageByTeacher(String no);

    List<String> getTeaClass(String no);

    void updateTeacher(String no, String name, int age, String sex, String[] teaclass, String subject);

}
