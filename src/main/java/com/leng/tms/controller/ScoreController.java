package com.leng.tms.controller;

import com.github.pagehelper.PageInfo;
import com.leng.tms.bean.Students;
import com.leng.tms.bean.Users;
import com.leng.tms.service.ScoreService;
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
public class ScoreController {

    @Autowired
    private ScoreService scoreService;

    @RequestMapping("/scoreentry")
    public String getScore(Model model, int page) {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        String subject = scoreService.getTeaSubject(user.getUsername());
        model.addAttribute("subject", subject);
        PageInfo<Students> pageInfo = scoreService.getTeaStudent(page, user.getUsername());
        model.addAttribute("pageInfo", pageInfo);
        return "scoreentry";
    }

    @RequestMapping("/entry")
    @ResponseBody
    public String entry(String tno, String sno, int score) {
        if (scoreService.entry(tno, sno, score))
            return "success";
        return "error";
    }

    @RequestMapping("/scoresearch")
    public String getAllScore(Model model, int page){
        PageInfo<Students> pageInfo = scoreService.getAllStudent(page);
        model.addAttribute("pageInfo", pageInfo);
        return "scoresearch";
    }

    @RequestMapping("/findstudent")
    @ResponseBody
    public List findStudent(String no, String name, String stuclass){
        return scoreService.findStudent(no, name, stuclass);
    }

}
