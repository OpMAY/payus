package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.*;
import com.mvsolutions.payus.model.rest.basic.NotificationUser;
import com.mvsolutions.payus.model.rest.basic.PointAccumulate;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorChargeCancelRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointCancelRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointChargeRequest;
import com.mvsolutions.payus.model.rest.response.suppointpage.PaybackUserDataResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.SupPointChargeDataResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointAccumulateListResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointChargeListResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.notification.NotificationMessage;
import com.mvsolutions.payus.response.payus.notification.NotificationType;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.util.List;

@Service
@Log4j
public class PointService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private UserDao userDao;

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private NotificationUserDao notificationUserDao;

    @Autowired
    private NotificationVendorDao notificationVendorDao;

    @Autowired
    private ReviewDao reviewDao;

    @Autowired
    private VendorDao vendorDao;

    @Autowired
    private PointChargeDao pointChargeDao;

    @Autowired
    private PointChargeCancelDao pointChargeCancelDao;

    @Autowired
    private PointChargeRejectDao pointChargeRejectDao;

    @Autowired
    private PointAccumulateDao pointAccumulateDao;

    @Autowired
    private PointAccumulateCancelDao pointAccumulateCancelDao;

    @Autowired
    private PointAccumulateRejectDao pointAccumulateRejectDao;

    @Autowired
    private PointWithdrawDao pointWithdrawDao;

    @Autowired
    private PointWithdrawRejectDao pointWithdrawRejectDao;

    @Transactional(readOnly = true)
    public ResponseEntity getDataForPointCharge(int vendor_no) throws JSONException {
        Message message = new Message();
        vendorDao.setSqlSession(sqlSession);
        // vendor_no, point 반환
        SupPointChargeDataResponse response = vendorDao.getVendorPoint(vendor_no);
        message.put("vendor_point", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getDataForPointCharge()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity chargeRequestVendorPoint(VendorPointChargeRequest request) {
        pointChargeDao.setSqlSession(sqlSession);
        pointChargeDao.insertNewPointChargeRequest(request, Time.TimeFormatHMS());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getVendorPointList(int vendor_no) throws JSONException {
        Message message = new Message();
        pointChargeDao.setSqlSession(sqlSession);
        pointAccumulateDao.setSqlSession(sqlSession);
        List<VendorPointAccumulateListResponse> accumulateList = pointAccumulateDao.getVendorAccumulateList(vendor_no);
        List<VendorPointChargeListResponse> chargeList = pointChargeDao.getVendorChargeList(vendor_no);
        pointAccumulateDao.updateVendorReadCheck(accumulateList);
        pointChargeDao.updateReadCheck(chargeList);
        message.put("accumulate", accumulateList);
        message.put("charge", chargeList);
        if (accumulateList.size() > 0) {
            message.put("last_index1", accumulateList.get(accumulateList.size() - 1).getAccumulate_no());
        }
        if (chargeList.size() > 0) {
            message.put("last_index2", chargeList.get(chargeList.size() - 1).getCharge_no());
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorPointList()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getVendorPointListReload(int vendor_no, int last_index, int reload_type) throws JSONException {
        Message message = new Message();
        if (reload_type == 1) {
            pointAccumulateDao.setSqlSession(sqlSession);
            List<VendorPointAccumulateListResponse> accumulateList = pointAccumulateDao.getVendorAccumulateListReload(vendor_no, last_index);
            pointAccumulateDao.updateVendorReadCheck(accumulateList);
            message.put("accumulate", accumulateList);
            if (accumulateList.size() > 0) {
                message.put("last_index1", accumulateList.get(accumulateList.size() - 1).getAccumulate_no());
            }
        } else if (reload_type == 2) {
            pointChargeDao.setSqlSession(sqlSession);
            List<VendorPointChargeListResponse> chargeList = pointChargeDao.getVendorChargeListReload(vendor_no, last_index);
            pointChargeDao.updateReadCheck(chargeList);
            message.put("charge", chargeList);
            if (chargeList.size() > 0) {
                message.put("last_index2", chargeList.get(chargeList.size() - 1).getCharge_no());
            }
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorPointListReload()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getVendorPointRejectReason(int content_no, int content_type) throws JSONException {
        Message message = new Message();
        if (content_type == 1) {
            pointAccumulateRejectDao.setSqlSession(sqlSession);
            String reason = pointAccumulateRejectDao.getAccumulateRejectReason(content_no);
            message.put("reason", reason);
        } else if (content_type == 2) {
            pointChargeRejectDao.setSqlSession(sqlSession);
            String reason = pointChargeRejectDao.getChargeRejectReason(content_no);
            message.put("reason", reason);
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorPointRejectReason()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity cancelAccumulatePoint(VendorPointCancelRequest request) throws ParseException {
        pointAccumulateCancelDao.setSqlSession(sqlSession);
        pointAccumulateDao.setSqlSession(sqlSession);
        PointAccumulate pointAccumulate = pointAccumulateDao.getPointAccumulateByAccumulateNo(request.getAccumulate_no());
        if (Time.DateCompare(Time.DatePlusDays(pointAccumulate.getReg_date(), 3), Time.TimeFormatHMS()) == 1) {
            // 취소 요청 가능 기간 지났을 때
            return new ResponseEntity(StringRes.res(StatusCode.TIME_EXPIRED), HttpStatus.OK);
        } else if (pointAccumulateDao.checkPointAbleToCancel(request.getAccumulate_no())) {
            // 취소 가능 상태가 아닐 때
            return new ResponseEntity(StringRes.res(StatusCode.CAN_NOT_CANCEL_POINT), HttpStatus.OK);
        }
        request.setReg_date(Time.TimeFormatHMS());
        // 취소 요청 정보
        pointAccumulateCancelDao.insertPointCancelRequest(request);
        // 취소 요청 상태로 변경
        pointAccumulateDao.pointCancelRequestUpdate(request.getAccumulate_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity cancelCharge(VendorChargeCancelRequest request) {
        pointChargeDao.setSqlSession(sqlSession);
        pointChargeCancelDao.setSqlSession(sqlSession);
        if(pointChargeDao.checkChargeAbleToCancel(request.getCharge_no())){
            // 충전 요청 상태가 아닐 때
            return new ResponseEntity(StringRes.res(StatusCode.CAN_NOT_CANCEL_POINT), HttpStatus.OK);
        }
        request.setReg_date(Time.TimeFormatHMS());
        // 취소 요청 정보
        pointChargeCancelDao.insertChargeCancelRequest(request);
        // 취소 요청 상태로 변경
        pointChargeDao.chargeCancelRequestUpdate(request.getCharge_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getUserDataForPayback(int user_code) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        // 유저 코드 = user_no + 10000000
        int user_no = user_code - 10000000;
        PaybackUserDataResponse response = userDao.getUserDataForPayback(user_no);
        if(response == null) {
            // 유저 정보 없을 때 U404
            return new ResponseEntity(StringRes.res(StatusCode.NO_USER_DETECTED), HttpStatus.OK);
        } else if (response.isUser_penalty()) {
            return new ResponseEntity(StringRes.res(StatusCode.PENALTY_USER), HttpStatus.OK);
        }
        message.put("user", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserDataForPayback()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity requestPayback(PaybackRequest request) {
        pointAccumulateDao.setSqlSession(sqlSession);
        notificationUserDao.setSqlSession(sqlSession);
        notificationVendorDao.setSqlSession(sqlSession);
        userDao.setSqlSession(sqlSession);
        vendorDao.setSqlSession(sqlSession);
        String time = Time.TimeFormatHMS();
        request.setReg_date(time);
        // 페이백 내역 입력
        pointAccumulateDao.requestPayback(request);
        // 유저 포인트 +, 공급자 포인트 -
        userDao.requestPayback(request);
        vendorDao.requestPayback(request);
        // 유저에게 알림 전송
        NotificationUser notificationUser = new NotificationUser();
        notificationUser.setUser_no(request.getUser_no());
//        notificationUser.setContent(NotificationMessage.PointPayback());
        notificationUser.setReg_date(time);
        notificationUser.setType(NotificationType.PAYBACK);
        // 공급자에게 알림 전송
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }
}
