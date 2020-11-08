package com.leng.tms.service.impl;

import com.leng.tms.bean.Students;
import com.leng.tms.bean.Teachers;
import com.leng.tms.bean.Users;
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
        if (user.getPassword().equals(password))
            return true;
        return false;
    }

    @Override
    public boolean registe(Users user) {
        if (userDao.checkUser(user.getUsername()) != 0)
            return false;
        else {
            userDao.registe(user);
            if (user.getRolelevel().equals("学生"))
                userDao.insertToStudents(user.getUsername());
            else
                userDao.insertToTeachers(user.getUsername());
            return true;
        }
    }

    @Override
    public boolean check(String no) {
        if (no.charAt(0) == 'S') {
            Students s = userDao.checkStudent(no);
            try {
                if (s.getName().equals("") || s.getName() == null ||
                        s.getAge() == 0 || s.getSex().equals("") ||
                        s.getSex() == null || s.getStuclass().equals("") ||
                        s.getStuclass() == null || s.getDormitory().equals("") ||
                        s.getDormitory() == null) {
                    return false;
                }
            } catch (Exception e) {
                return false;
            }
        } else if (no.charAt(0) == 'T'){
            Teachers t = userDao.checkTeacher(no);
            try {
                if (t.getName().equals("") || t.getName() == null ||
                        t.getAge() == 0 || t.getSex().equals("") ||
                        t.getSex() == null || t.getSubject().equals("") ||
                        t.getSubject() == null) {
                    return false;
                }
                List<String> classlist = userDao.checkTeachClass(no);
                if (classlist.size() == 0)
                    return false;
            } catch (Exception e) {
                return false;
            }
        } else
            return true;
        return true;
    }

}
