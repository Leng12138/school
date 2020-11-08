package com.leng.tms.controller;

import com.github.pagehelper.PageInfo;
import com.leng.tms.bean.Teachers;
import com.leng.tms.bean.Users;
import com.leng.tms.service.JudgeTeachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Controller
public class JudgeTeachController {

    @Autowired
    private JudgeTeachService judgeTeachService;

    @RequestMapping("/judgeteacher")
    public String getJudgeResult(Model model, int page) {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        PageInfo<Teachers> pageInfo = judgeTeachService.getJudgeResult(page, user.getUsername());
        model.addAttribute("pageInfo", pageInfo);
        return "judgeteacher";
    }

    @RequestMapping("/judgeteach")
    @ResponseBody
    public String judgeTeach(String no, String clat, String teme, String woco, String qaat) {
        if (judgeTeachService.judgeTeach(no, clat, teme, woco, qaat))
            return "success";
        return "error";
    }

    @RequestMapping("/judgeresult")
    public String getAllJudgeResult(Model model, int page) {
        PageInfo<Teachers> pageInfo = judgeTeachService.getAllJudgeResult(page);
        model.addAttribute("pageInfo", pageInfo);
        return "judgeresult";
    }

    @RequestMapping("/findteacher")
    @ResponseBody
    public List findTeacher(String no, String name, String subject) {
        return judgeTeachService.findTeacher(no, name, subject);
    }

}
