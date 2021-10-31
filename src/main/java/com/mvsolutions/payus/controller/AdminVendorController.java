package com.mvsolutions.payus.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@Log4j
@RequestMapping(method = RequestMethod.GET)
public class AdminVendorController {
    private ModelAndView VIEW;

    @RequestMapping("/vendor/login.do")
    public ModelAndView VendorLoginPage(HttpServletRequest request,
                                        HttpServletResponse response) {
        VIEW = new ModelAndView("login_vendor");
        return VIEW;
    }

    @RequestMapping("/vendor/register.do")
    public ModelAndView VendorRegisterPage() {
        VIEW = new ModelAndView("register_vendor");
        return VIEW;
    }

    @RequestMapping("/vendor/register/business.do")
    public ModelAndView VendorBusinessPage() {
        VIEW = new ModelAndView("business_vendor");
        return VIEW;
    }

    @RequestMapping("/vendor/find/identification.do")
    public ModelAndView VendorFindIdPage() {
        VIEW = new ModelAndView("vendor_find_id");
        return VIEW;
    }

    @RequestMapping("/vendor/find/identification/result.do")
    public ModelAndView VendorFindIdResultPage() {
        VIEW = new ModelAndView("vendor_result_id");
        return VIEW;
    }

    @RequestMapping("/vendor/find/password.do")
    public ModelAndView VendorFindPasswordPage(){
        VIEW = new ModelAndView("vendor_find_password");
        return VIEW;
    }

    @RequestMapping("/vendor/find/password/result.do")
    public ModelAndView VendorFindPasswordResultPage(){
        VIEW = new ModelAndView("vendor_set_password");
        VIEW.addObject("ID", "kevin8622");
        return VIEW;
    }
}
