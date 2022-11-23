package com.leng.tms.service.impl;

import com.leng.tms.domain.Students;
import com.leng.tms.domain.Teachers;
import com.leng.tms.domain.Users;
import com.leng.tms.dao.UserDao;
import com.leng.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Users selectUser(String username) {
        return userDao.selectUser(username);
    }

    @Override
    public boolean login(Users user) {
        String password = userDao.login(user.getUsername());
        return user.getPassword().equals(password);
    }

    @Override
    public boolean registe(Users user) {
        if (userDao.checkUser(user.getUsername()) != 0) {
            return false;
        } else {
            userDao.registe(user);
            if ("学生".equals(user.getRolelevel())) {
                userDao.insertToStudents(user.getUsername());
            } else {
                userDao.insertToTeachers(user.getUsername());
            }
            return true;
        }
    }

    @Override
    public boolean check(String no) {
        if (no.charAt(0) == 'S') {
            Students s = userDao.checkStudent(no);
            try {
                if ("".equals(s.getName()) || s.getName() == null ||
                        s.getAge() == 0 || "".equals(s.getSex()) ||
                        s.getSex() == null || "".equals(s.getStuclass()) ||
                        s.getStuclass() == null || "".equals(s.getDormitory()) ||
                        s.getDormitory() == null) {
                    return false;
                }
            } catch (Exception e) {
                return false;
            }
        } else if (no.charAt(0) == 'T'){
            Teachers t = userDao.checkTeacher(no);
            try {
                if ("".equals(t.getName()) || t.getName() == null ||
                        t.getAge() == 0 || "".equals(t.getSex()) ||
                        t.getSex() == null || "".equals(t.getSubject()) ||
                        t.getSubject() == null) {
                    return false;
                }
                List<String> classlist = userDao.checkTeachClass(no);
                if (classlist.size() == 0) {
                    return false;
                }
            } catch (Exception e) {
                return false;
            }
        } else {
            return true;
        }
        return true;
    }

}
