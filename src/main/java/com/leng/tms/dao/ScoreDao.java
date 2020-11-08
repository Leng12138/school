package com.leng.tms.dao;

import com.leng.tms.bean.Students;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScoreDao {

    List<String> getTeaClass(String no);

    List<Students> getTeaStudent(List<String> list);

    String getTeaSubject(String no);

    int updateC(@Param("no") String no, @Param("cscore") int score);

    int updateOS(@Param("no") String no, @Param("osscore") int score);

    int updateCI(@Param("no") String no, @Param("ciscore") int score);

    int updateSE(@Param("no") String no, @Param("sescore") int score);

    List<Students> getAllStudent();

    List<Students> findStudent(@Param("no") String no, @Param("name") String name, @Param("stuclass") String stuclass);

}
