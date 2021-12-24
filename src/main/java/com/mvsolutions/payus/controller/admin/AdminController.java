package com.mvsolutions.payus.controller.admin;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j2
@RequestMapping(value = "/admin", method = RequestMethod.GET)
public class AdminController {

    private ModelAndView VIEW;

    @RequestMapping("/login.do")
    public ModelAndView AdminLoginPage() {
        VIEW = new ModelAndView("/admin/admin_login");
        return VIEW;
    }

    @RequestMapping("/home/dashboard.do")
    public ModelAndView AdminDashBoardPage() {
        VIEW = new ModelAndView("/admin/admin_dashboard");
        return VIEW;
    }
}
