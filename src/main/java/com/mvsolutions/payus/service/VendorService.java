package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.PenaltyVendorDao;
import com.mvsolutions.payus.dao.StoreDao;
import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorHomeRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorPenaltyResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorHomeResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.PointStoreDataResponse;
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
public class VendorService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private VendorDao vendorDao;

    @Autowired
    private PenaltyVendorDao penaltyVendorDao;

    @Autowired
    private StoreDao storeDao;

    @Transactional(readOnly = true)
    public ResponseEntity loginVendor(VendorLoginRequest request) throws JSONException {
        Message message = new Message();
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkVendorExists(request)) {
            // 로그인 성공 시
            VendorLoginResponse response = vendorDao.loginVendor(request);
            message.put("vendor", response);
            if (vendorDao.checkVendorPenalty(response.getVendor_no())) {
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

    @Transactional(readOnly = true)
    public ResponseEntity getVendorHome(int vendor_no) throws JSONException {
        Message message = new Message();
        vendorDao.setSqlSession(sqlSession);
        VendorHomeResponse response = vendorDao.getVendorHome(vendor_no);
        if (response == null) {
            // 잘못 접근해서 vendor_no가 올바르지 않을 시
            return new ResponseEntity(StringRes.res(StatusCode.LOGIN_FAILED), HttpStatus.OK);
        }
        message.put("vendor", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorHome()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getStorePaybackData(int vendor_no) throws JSONException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        PointStoreDataResponse response = storeDao.getStorePaybackData(vendor_no);
        if(response == null) {
            // 회원 탈퇴한 공급자가 해당 화면에 들어오게 될 경우 400
            return new ResponseEntity(IntegerRes.res(StatusCode.BAD_REQUEST), HttpStatus.OK);
        }
        message.put("store", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getStorePaybackData()")), HttpStatus.OK);
    }
}
