package com.leng.tms.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.leng.tms.bean.Students;
import com.leng.tms.dao.ScoreDao;
import com.leng.tms.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService {

    @Autowired
    private ScoreDao scoreDao;

    @Override
    public PageInfo<Students> getTeaStudent(int page, String no) {
        List<String> list = scoreDao.getTeaClass(no);
        PageHelper.startPage(page, 9);
        List<Students> bak = scoreDao.getTeaStudent(list);
        PageInfo<Students> pageInfo = new PageInfo<>(bak, 3);
        return pageInfo;
    }

    @Override
    public boolean entry(String tno, String sno, int score) {
        try {
            String subject = scoreDao.getTeaSubject(tno);
            switch (subject) {
                case "C程序设计":
                    scoreDao.updateC(sno, score);
                    return true;
                case "操作系统":
                    scoreDao.updateOS(sno, score);
                    return true;
                case "计算机网络":
                    scoreDao.updateCI(sno, score);
                    return true;
                case "软件工程":
                    scoreDao.updateSE(sno, score);
                    return true;
            }
            return false;
        } catch (NullPointerException e) {
            return false;
        }
    }

    @Override
    public String getTeaSubject(String no) {
        return scoreDao.getTeaSubject(no);
    }

    @Override
    public PageInfo<Students> getAllStudent(int page) {
        PageHelper.startPage(page, 9);
        List<Students> bak = scoreDao.getAllStudent();
        PageInfo<Students> pageInfo = new PageInfo<>(bak, 3);
        return pageInfo;
    }

    @Override
    public List<Students> findStudent(String no, String name, String stuclass) {
        List<Students> list = scoreDao.findStudent(no, name, stuclass);
        return list;
    }

}
