package com.leng.tms.controller;

import com.leng.tms.domain.Users;
import com.leng.tms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(Users user, Model model, HttpSession session) {
        if (userService.login(user)) {
            session.setAttribute("user", userService.selectUser(user.getUsername()));
            return "redirect:/index.do";
        } else {
            model.addAttribute("error", "用户名或密码错误");
            return "forward:/login.jsp";
        }
    }

    @RequestMapping("/registe")
    public String registe(Users user, Model model) {
        if (user.getUsername() == null || user.getPassword() == null || user.getRolelevel() == null ||
                "".equals(user.getUsername()) || "".equals(user.getPassword()) || "".equals(user.getRolelevel())) {
            model.addAttribute("msg", "请完善所有选项");
            return "forward:/registe.jsp";
        } else if (userService.registe(user)) {
            return "redirect:/login.jsp";
        } else {
            model.addAttribute("error", "该用户已存在");
            return "forward:/registe.jsp";
        }
    }

    @RequestMapping("/check")
    @ResponseBody
    public String check(String no) {
        if (userService.check(no)) {
            return null;
        }
        return "miss";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/exit")
    public String exit() {
        HttpServletRequest request = ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login.jsp";
    }

}
