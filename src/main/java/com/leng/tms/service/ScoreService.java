package com.leng.tms.service;

import com.github.pagehelper.PageInfo;
import com.leng.tms.domain.Students;

import java.util.List;


public interface ScoreService {

    PageInfo<Students> getTeaStudent(int page, String no);

    boolean entry(String tno, String sno, int score);

    String getTeaSubject(String no);

    PageInfo<Students> getAllStudent(int page);

    List<Students> findStudent(String no, String name, String stuclass);

}
