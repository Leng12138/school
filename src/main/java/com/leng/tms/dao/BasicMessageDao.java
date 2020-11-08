package com.leng.tms.dao;

import com.leng.tms.bean.Students;
import com.leng.tms.bean.TeachClass;
import com.leng.tms.bean.Teachers;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.LinkedList;
import java.util.List;

@Repository
public interface BasicMessageDao {

    Students getBasicMessageByStudent(String no);

    int updateStudent(@Param("no") String no, @Param("name") String name, @Param("age") int age,
                      @Param("sex") String sex, @Param("stuclass") String stuclass, @Param("dormitory") String dormitory);

    Teachers getBasicMessageByTeacher(String no);

    List<String> getTeaClass(String no);

    int deleteTeachClass(String no);

    int updateToTeachers(@Param("no") String no, @Param("name") String name, @Param("age") int age,
                         @Param("sex") String sex, @Param("subject") String subject);

    int insertToTeachClass(LinkedList<TeachClass> list);

}
