package com.leng.tms.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leng.tms.domain.Teachers;
import com.leng.tms.dao.JudgeTeachDao;
import com.leng.tms.service.JudgeTeachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JudgeTeachServiceImpl implements JudgeTeachService {

    @Autowired
    private JudgeTeachDao judgeTeachDao;

    @Override
    public PageInfo<Teachers> getJudgeResult(int page, String no) {
        List<String> tnos = judgeTeachDao.thisSnoTno(no);
        PageHelper.startPage(page, 4);
        List<Teachers> list = judgeTeachDao.getJudgeResult(tnos);
        return new PageInfo<>(list, 3);
    }

    @Override
    public boolean judgeTeach(String no, String clat, String teme, String woco, String qaat) {
        return judgeTeachDao.updateJudge(no, clat, teme, woco, qaat) == 1;
    }

    @Override
    public PageInfo<Teachers> getAllJudgeResult(int page) {
        PageHelper.startPage(page, 4);
        List<Teachers> bak = judgeTeachDao.getAllJudgeResult();
        return new PageInfo<>(bak, 3);
    }

    @Override
    public List<Teachers> findTeacher(String no, String name, String subject) {
        return judgeTeachDao.findTeacher(no, name, subject);
    }

}
