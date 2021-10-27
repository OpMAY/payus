package com.mvsolutions.payus.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j
@RequestMapping(method = RequestMethod.GET)
public class AdminVendorController {
    private ModelAndView VIEW;

    @RequestMapping("/vendor/login.do")
    public ModelAndView VendorLoginPage(){
        VIEW = new ModelAndView("login_vendor");
        return VIEW;
    }

    @RequestMapping("/vendor/register.do")
    public ModelAndView VendorRegisterPage(){
        VIEW = new ModelAndView("register_vendor");
        return VIEW;
    }

    @RequestMapping("/vendor/register/business.do")
    public ModelAndView VendorBusinessPage(){
        VIEW = new ModelAndView("business_vendor");
        return VIEW;
    }

    @RequestMapping("/vendor/find/identification.do")
    public ModelAndView VendorFindIdPage(){
        VIEW = new ModelAndView("vendor_find_id");
        return VIEW;
    }

    @RequestMapping("/vendor/find/identification/result.do")
    public ModelAndView VendorFindIdResultPage(){
        VIEW = new ModelAndView("vendor_result_id");
        return VIEW;
    }
}
