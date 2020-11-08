package com.leng.tms.service.impl;

import com.leng.tms.bean.Students;
import com.leng.tms.bean.TeachClass;
import com.leng.tms.bean.Teachers;
import com.leng.tms.dao.BasicMessageDao;
import com.leng.tms.service.BasicMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class BasicMessageServiceImpl implements BasicMessageService {

    @Autowired
    private BasicMessageDao basicMessageDao;

    @Override
    public Students getBasicMessageByStudent(String no) {
        return basicMessageDao.getBasicMessageByStudent(no);
    }

    @Override
    public void updateStudent(String no, String name, int age, String sex, String stuclass, String dormitory) {
        basicMessageDao.updateStudent(no, name, age, sex, stuclass, dormitory);
    }

    @Override
    public Teachers getBasicMessageByTeacher(String no) {
        return basicMessageDao.getBasicMessageByTeacher(no);
    }

    @Override
    public List<String> getTeaClass(String no) {
        return basicMessageDao.getTeaClass(no);
    }

    @Override
    public void updateTeacher(String no, String name, int age, String sex, String[] teaclass, String subject) {
        LinkedList<TeachClass> list = new LinkedList<TeachClass>();
        for (String s : teaclass) {
            TeachClass bak = new TeachClass();
            bak.setNo(no);
            bak.setTeaclass(s);
            list.add(bak);
        }
        basicMessageDao.deleteTeachClass(no);
        basicMessageDao.updateToTeachers(no, name, age, sex, subject);
        basicMessageDao.insertToTeachClass(list);
    }
}
