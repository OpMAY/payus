package com.mvsolutions.payus.controller.admin;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
@RestController
@RequestMapping(value = "/admin", method = RequestMethod.POST)
public class AdminPostController {

    @Value("${payus.admin.id}")
    private String id;
    @Value("${payus.admin.password}")
    private String password;

    @RequestMapping("/login")
    public void AdminLogin(@RequestParam(value = "id")String id, @RequestParam(value = "password")String password, HttpServletRequest req, HttpServletResponse response) throws IOException {

        if(this.id.equals(id) && this.password.equals(password)) {
            req.getSession().invalidate();
            req.getSession().setAttribute("Admin", true);
            response.sendRedirect("/admin/home/dashboard.do");
        } else {
            req.getSession().setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
            response.sendRedirect("/admin/login.do");
        }
    }
}
