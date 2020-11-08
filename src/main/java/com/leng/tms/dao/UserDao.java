package com.leng.tms.dao;

import com.leng.tms.bean.Students;
import com.leng.tms.bean.Teachers;
import com.leng.tms.bean.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    String login(String username);

    int checkUser(String username);

    int registe(Users user);

    int insertToStudents(String no);

    int insertToTeachers(String no);

    Users selectUser(String username);

    Students checkStudent(String no);

    Teachers checkTeacher(String no);

    List<String> checkTeachClass(String no);

}
