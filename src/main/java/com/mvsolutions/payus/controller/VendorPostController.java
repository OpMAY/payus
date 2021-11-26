package com.mvsolutions.payus.controller;

import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.*;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorRegisterEmailResponse;
import com.mvsolutions.payus.service.VendorAdminService;
import com.mvsolutions.payus.util.Constant;
import com.mvsolutions.payus.util.FileUploadUtility;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

@Log4j
@RestController
@RequestMapping(value = "/vendor", method = RequestMethod.POST)
public class VendorPostController {
    @Autowired
    private VendorAdminService vendorAdminService;

    @Autowired
    private FileUploadUtility fileUploadUtility;

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

    @RequestMapping("/register/done/skip")
    public int VendorRegisterDoneSkipped(@RequestBody String body) {
        VendorRegisterRequest request = new Gson().fromJson(body, VendorRegisterRequest.class);
        return vendorAdminService.registerVendorSkipped(request);
    }

    @RequestMapping("/register/done/all")
    public int VendorRegisterDoneAll(HttpServletRequest request,
                                     @RequestParam("vendor_data") String vendor_data,
                                     @RequestParam("store_data") String store_data) throws IOException, URISyntaxException {
        // File Control
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        Iterator<String> keys = fileMap.keySet().iterator();
        ArrayList<String> imageList = new ArrayList<>();
        String time = Time.TimeForFile();
        String timeForDB = Time.TimeFormatHMS();
        while (keys.hasNext()) {
            String key = keys.next();
            if(key.contains("img")) {
                if(!fileMap.get(key).isEmpty()){
                    String path = fileUploadUtility.uploadFile("api/images/store/init/" + time + "/", fileMap.get(key).getOriginalFilename(), fileMap.get(key).getBytes(), Constant.AWS_SAVE);
                    imageList.add("api/images/store/init/" + time + "/" + path);
                }
            }
        }
        VendorRegisterRequest vendorRegisterRequest = new Gson().fromJson(vendor_data, VendorRegisterRequest.class);
        vendorRegisterRequest.setReg_date(timeForDB);
        StoreRegisterRequest storeRegisterRequest = new Gson().fromJson(store_data, StoreRegisterRequest.class);
        if(imageList.size() > 0) {
            storeRegisterRequest.setThumbnail(imageList.get(0));
            storeRegisterRequest.setImage_list(new Gson().toJson(imageList));
            storeRegisterRequest.setReg_date(timeForDB);
        }
        return vendorAdminService.registerVendorAll(vendorRegisterRequest, storeRegisterRequest);
    }
}
