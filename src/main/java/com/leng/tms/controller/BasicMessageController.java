package com.leng.tms.controller;

import com.leng.tms.domain.Students;
import com.leng.tms.domain.Teachers;
import com.leng.tms.service.BasicMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BasicMessageController {

    @Autowired
    private BasicMessageService basicMessageService;

    @RequestMapping("/basicmessage_student")
    public String getBasicMessageByStudent(String username, Model model) {
        Students s = basicMessageService.getBasicMessageByStudent(username);
        model.addAttribute("stu", s);
        return "basicmessage_student";
    }

    @RequestMapping("/updatestudent")
    @ResponseBody
    public String updateStudent(String username, String name, int age, String sex, String stuclass, String dormitory) {
        basicMessageService.updateStudent(username, name, age, sex, stuclass, dormitory);
        return "success";
    }

    @RequestMapping("/basicmessage_teacher")
    public String getBasicMessageByTeacher(String username, Model model) {
        Teachers t = basicMessageService.getBasicMessageByTeacher(username);
        List<String> list = basicMessageService.getTeaClass(username);
        model.addAttribute("tea", t);
        model.addAttribute("list", list.toString().replaceAll("\\[([^]]*)]", "$1"));
        return "basicmessage_teacher";
    }

    @RequestMapping("/updateteacher")
    @ResponseBody
    public String updateTeacher(String username, String name, int age, String sex, String[] teaclass, String subject) {
        basicMessageService.updateTeacher(username, name, age, sex, teaclass, subject);
        return "success";
    }

}
