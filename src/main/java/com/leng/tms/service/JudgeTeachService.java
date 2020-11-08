package com.leng.tms.service;

import com.github.pagehelper.PageInfo;
import com.leng.tms.bean.Teachers;

import java.util.List;


public interface JudgeTeachService {

    PageInfo<Teachers> getJudgeResult(int page, String no);

    boolean judgeTeach(String no, String clat, String teme, String woco, String qaat);

    PageInfo<Teachers> getAllJudgeResult(int page);

    List<Teachers> findTeacher(String no, String name, String subject);

}
