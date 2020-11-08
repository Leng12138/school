package com.leng.tms.dao;

import com.leng.tms.bean.Teachers;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JudgeTeachDao {

    List<String> thisSnoTno(String no);

    List<Teachers> getJudgeResult(List<String> tnos);

    int updateJudge(@Param("no") String no, @Param("clat") String clat, @Param("teme") String teme, @Param("woco") String woco, @Param("qaat") String qaat);

    List<Teachers> getAllJudgeResult();

    List<Teachers> findTeacher(@Param("no") String no, @Param("name") String name, @Param("subject") String subject);

}
