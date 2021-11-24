package com.mvsolutions.payus.controller;

import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.service.VendorAdminService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@Log4j
@RequestMapping(value = "/vendor", method = RequestMethod.GET)
public class AdminVendorController {
    @Autowired
    private VendorAdminService vendorAdminService;

    private ModelAndView VIEW;

    @RequestMapping("/login.do")
    public ModelAndView VendorLoginPage() {
        VIEW = new ModelAndView("login_vendor");
        return VIEW;
    }

    @RequestMapping("/register.do")
    public ModelAndView VendorRegisterPage() {
        VIEW = new ModelAndView("register_vendor");
        return VIEW;
    }

    @RequestMapping("/register/bank.do")
    public ModelAndView VendorBankPage() {
        VIEW = new ModelAndView("register_vendor_2");
        return VIEW;
    }

    @RequestMapping("/register/business.do")
    public ModelAndView VendorBusinessPage() {
        VIEW = new ModelAndView("register_vendor_3");
        return VIEW;
    }

    @RequestMapping("/find/identification.do")
    public ModelAndView VendorFindIdPage() {
        VIEW = new ModelAndView("vendor_find_id");
        return VIEW;
    }

    @RequestMapping("/find/identification/result.do")
    public ModelAndView VendorFindIdResultPage(HttpServletRequest request, HttpServletResponse response) {
        VIEW = new ModelAndView("vendor_result_id");
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("vendor_find_no")) {
                String id = vendorAdminService.findIdVendor(Integer.parseInt(cookie.getValue()));
                VIEW.addObject("id", id);
                Cookie setCookie = new Cookie("vendor_find_no", null);
                setCookie.setMaxAge(0);
                response.addCookie(setCookie);
                break;
            }
        }
        return VIEW;
    }

    @RequestMapping("/find/password.do")
    public ModelAndView VendorFindPasswordPage() {
        VIEW = new ModelAndView("vendor_find_password");
        return VIEW;
    }

    @RequestMapping("/find/password/result.do")
    public ModelAndView VendorFindPasswordResultPage(HttpServletRequest request, HttpServletResponse response) {
        VIEW = new ModelAndView("vendor_set_password");
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("find_password_no")) {
                VendorPasswordFindResultData data = vendorAdminService.getPasswordFindResult(Integer.parseInt(cookie.getValue()));
                VIEW.addObject("id", data.getId());
                VIEW.addObject("vendor_no", data.getVendor_no());
                Cookie setCookie = new Cookie("find_password_no", null);
                setCookie.setMaxAge(0);
                setCookie.setPath(cookie.getPath());
                response.addCookie(setCookie);
            } else if (cookie.getName().equals("validation_code")) {
                Cookie setCookie = new Cookie("validation_code", null);
                setCookie.setMaxAge(0);
                setCookie.setPath(cookie.getPath());
                response.addCookie(setCookie);
            }
        }
        return VIEW;
    }
}
