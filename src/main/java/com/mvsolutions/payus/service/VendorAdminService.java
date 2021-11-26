package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusRequest;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.*;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorRegisterEmailResponse;
import com.mvsolutions.payus.util.BusinessValidationService;
import com.mvsolutions.payus.util.EmailSendService;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Log4j
@Service
public class VendorAdminService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private VendorDao vendorDao;

    @Autowired
    private EmailSendService emailSendService;

    @Autowired
    private BusinessValidationService businessValidationService;

    @Transactional(readOnly = true)
    public VendorLoginResponse loginVendor(VendorLoginRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkVendorExists(request)) {
            return vendorDao.loginVendor(request);
        } else {
            return new VendorLoginResponse(0);
        }
    }

    @Transactional(readOnly = true)
    public String findIdVendor(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.findIdVendor(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorFindIdResponse vendorFindIdPost(VendorFindIdRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorFindIdResponse response = vendorDao.vendorFindIdPost(request);
        if (response == null)
            return new VendorFindIdResponse(0);
        else
            return response;
    }

    @Transactional(readOnly = true)
    public VendorPasswordFindResponse findPassword(HttpServletResponse servletResponse, VendorFindPasswordRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorPasswordFindResponse response = vendorDao.findPassword(request);
        if (response.isId_exist()) {
            String validationCode = emailSendService.sendEmailForValidation(request.getId());
            response.setValidation_code(validationCode);
        }
        return response;
    }

    @Transactional(readOnly = true)
    public VendorPasswordFindResultData getPasswordFindResult(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getPasswordFindResult(vendor_no);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int resetPassword(VendorPasswordResetRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if(vendorDao.checkVendorCurrentPassword(request)) {
           return 1;
        }
        vendorDao.resetPassword(request);
        return 0;
    }

    public VendorRegisterEmailResponse validateEmail(VendorRegisterEmailRequest request) {
        vendorDao.setSqlSession(sqlSession);
//        if(vendorDao.checkVendorExistsByEmail(request.getEmail())) {
//            return new VendorRegisterEmailResponse("");
//        } else {
            String validationCode = emailSendService.sendEmailForValidation(request.getEmail());
            return new VendorRegisterEmailResponse(validationCode);
//        }
    }

    public int validateBusinessNumber(VendorBusinessValidateRequest request) throws IOException {
        ArrayList<String> businessNumberList = new ArrayList<>();
        businessNumberList.add(request.getBusiness_number().replaceAll("-", ""));
        BusinessStatusRequest statusRequest = new BusinessStatusRequest(businessNumberList);
        String status = businessValidationService.statusVerify(statusRequest);
        BusinessStatusResponse statusResponse = new Gson().fromJson(status, BusinessStatusResponse.class);
        if(statusResponse.getStatus_code().equals("OK")) {
            if(statusResponse.getData().get(0).getB_stt().equals("계속사업자") || statusResponse.getData().get(0).getB_stt_cd().equals("01")) {
                return 1;
            } else if (statusResponse.getData().get(0).getB_stt().equals("휴업자") || statusResponse.getData().get(0).getB_stt_cd().equals("02")) {
                return 2;
            } else if (statusResponse.getData().get(0).getB_stt().equals("폐업자") || statusResponse.getData().get(0).getB_stt_cd().equals("03")) {
                return 3;
            } else if (statusResponse.getData().get(0).getTax_type().equals("국세청에 등록되지 않은 사업자등록번호입니다.")) {
                return 4;
            }
        } else {
            return 0;
        }
        return 0;
    }
}
