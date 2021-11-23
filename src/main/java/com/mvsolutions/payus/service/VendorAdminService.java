package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindIdRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindPasswordRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorPasswordResetRequest;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.util.EmailSendService;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;

@Log4j
@Service
public class VendorAdminService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private VendorDao vendorDao;

    @Autowired
    private EmailSendService emailSendService;

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
}
