package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.PenaltyVendorDao;
import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorPenaltyResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class VendorLoginService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private VendorDao vendorDao;

    @Autowired
    private PenaltyVendorDao penaltyVendorDao;

    @Transactional(readOnly = true)
    public ResponseEntity loginVendor(VendorLoginRequest request) throws JSONException {
        Message message = new Message();
        vendorDao.setSqlSession(sqlSession);
        if(vendorDao.checkVendorExists(request)){
            // 로그인 성공 시
            VendorLoginResponse response = vendorDao.loginVendor(request);
            message.put("vendor", response);
            if(vendorDao.checkVendorPenalty(response.getVendor_no())){
                // 정지된 공급자 일 시
                penaltyVendorDao.setSqlSession(sqlSession);
                List<VendorPenaltyResponse> penaltyList = penaltyVendorDao.getVendorPenaltyInfo(response.getVendor_no());
                String name = vendorDao.getVendorName(response.getVendor_no());
                VendorPenaltyResponse penaltyResponse = penaltyList.get(0);
                penaltyResponse.setName(name);
                message.put("penalty", penaltyResponse);
            }
        } else {
            // 로그인 실패 시
            return new ResponseEntity(StringRes.res(StatusCode.LOGIN_FAILED), HttpStatus.OK);
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("loginVendor()")), HttpStatus.OK);
    }
}
