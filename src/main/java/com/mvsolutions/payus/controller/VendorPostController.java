package com.mvsolutions.payus.controller;

import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.*;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorRegisterEmailResponse;
import com.mvsolutions.payus.service.VendorAdminService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j
@RestController
@RequestMapping(value = "/vendor", method = RequestMethod.POST)
public class VendorPostController {
    @Autowired
    private VendorAdminService vendorAdminService;

    @RequestMapping("/login")
    public VendorLoginResponse VendorLogin(@RequestBody String body) {
        VendorLoginRequest request = new Gson().fromJson(body, VendorLoginRequest.class);
        return vendorAdminService.loginVendor(request);
    }

    @RequestMapping("/find/id")
    public VendorFindIdResponse VendorFindId(@RequestBody String body) {
        VendorFindIdRequest request = new Gson().fromJson(body, VendorFindIdRequest.class);
        return vendorAdminService.vendorFindIdPost(request);
    }

    @RequestMapping("/find/password/email/validate")
    public VendorPasswordFindResponse VendorFindPassword(HttpServletResponse servletResponse, @RequestBody String body) {
        VendorFindPasswordRequest request = new Gson().fromJson(body, VendorFindPasswordRequest.class);
        return vendorAdminService.findPassword(servletResponse, request);
    }

    @RequestMapping("/validate/cookie")
    public int ValidateCodeFromCookie(HttpServletRequest servletRequest, @RequestBody String body) {
        VendorValidationCodeRequest request = new Gson().fromJson(body, VendorValidationCodeRequest.class);
        for(Cookie cookie : servletRequest.getCookies()) {
            if(cookie.getName().equals("validation_code")){
                if(request.getValidation_code().equals(cookie.getValue())){
                    return 0;
                } else {
                    return 1;
                }
            }
        }
        return 2;
    }

    @RequestMapping("/find/password/reset")
    public int VendorResetPassword(@RequestBody String body) {
        VendorPasswordResetRequest request = new Gson().fromJson(body, VendorPasswordResetRequest.class);
        return vendorAdminService.resetPassword(request);
    }

    @RequestMapping("/register/email/validate")
    public VendorRegisterEmailResponse VendorValidateEmail(@RequestBody String body) {
        VendorRegisterEmailRequest request = new Gson().fromJson(body, VendorRegisterEmailRequest.class);
        return vendorAdminService.validateEmail(request);
    }

    @RequestMapping("/register/business/validate")
    public int VendorValidateBusinessNumber(@RequestBody String body) throws IOException {
        VendorBusinessValidateRequest request = new Gson().fromJson(body, VendorBusinessValidateRequest.class);
        return vendorAdminService.validateBusinessNumber(request);
    }
}
