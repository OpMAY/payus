package com.mvsolutions.payus.interceptor;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
@Log4j2
public class VendorAdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if(session != null) {
            Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
            if(vendor_no != null){
                return true;
            }
        }
        response.sendRedirect("/vendor/login.do");
        return false;
    }
}
