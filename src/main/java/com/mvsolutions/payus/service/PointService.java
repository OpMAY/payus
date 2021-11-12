package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.*;
import com.mvsolutions.payus.model.rest.basic.NotificationUser;
import com.mvsolutions.payus.model.rest.basic.PointAccumulate;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorChargeCancelRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointCancelRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointChargeRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserPointWithdrawRequest;
import com.mvsolutions.payus.model.rest.response.suppointpage.*;
import com.mvsolutions.payus.model.rest.response.usermypage.UserWithdrawPageResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.notification.NotificationType;
import com.mvsolutions.payus.response.payus.point.PaybackRule;
import com.mvsolutions.payus.response.payus.point.PointAccumulateType;
import com.mvsolutions.payus.response.payus.point.PointChargeType;
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
        // 충전 요청 내역 등록
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
            // 적립 내역 last_index
            message.put("last_index1", accumulateList.get(accumulateList.size() - 1).getAccumulate_no());
        }
        if (chargeList.size() > 0) {
            // 충전 내역 last_index
            message.put("last_index2", chargeList.get(chargeList.size() - 1).getCharge_no());
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorPointList()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getVendorPointListReload(int vendor_no, int last_index, int reload_type) throws JSONException {
        Message message = new Message();
        if (reload_type == 1) {
            // 적립 내역 리로딩
            pointAccumulateDao.setSqlSession(sqlSession);
            List<VendorPointAccumulateListResponse> accumulateList = pointAccumulateDao.getVendorAccumulateListReload(vendor_no, last_index);
            pointAccumulateDao.updateVendorReadCheck(accumulateList);
            message.put("accumulate", accumulateList);
            if (accumulateList.size() > 0) {
                message.put("last_index1", accumulateList.get(accumulateList.size() - 1).getAccumulate_no());
            }
        } else if (reload_type == 2) {
            // 충전 내역 리로딩
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
        // 포인트 적립
        // - 취소됨, 취소 요청, 취소 요청 반려됨 밖에 없음 (적립은 반려 X)
        // 포인트 충전
        // - 취소 요청됨, 취소됨, 충전 반려됨 (충전 취소를 반려하는 것은 없음, 충전 완료 상태에선 취소 불가)
        if (content_type == 1) {
            // 적립 내역의 반려 및 취소 사유
            pointAccumulateRejectDao.setSqlSession(sqlSession);
            String reason;
            int status = pointAccumulateDao.getPointAccumulateByAccumulateNo(content_no).getStatus();
            if (status == PointAccumulateType.CANCEL_REQUEST || status == PointAccumulateType.CANCELED) {
                // 취소 사유 전송 (취소 요청 전송됨, 취소됨)
                reason = pointAccumulateCancelDao.getPointAccumulateCancelReason(content_no);
            } else if (status == PointAccumulateType.CANCEL_REJECT) {
                // 취소 요청 반려 사유 전송
                reason = pointAccumulateRejectDao.getAccumulateRejectReason(content_no);
            } else {
                return new ResponseEntity(StringRes.res(StatusCode.POINT_STATUS_ERROR), HttpStatus.OK);
            }
            message.put("reason", reason);
        } else if (content_type == 2) {
            // 충전 내역의 반려 사유 - 반려 상태일 때만 반려 사유 존재
            // 충전 내역 취소 요청, 취소됨 - 취소 사유
            pointChargeRejectDao.setSqlSession(sqlSession);
            int status = pointChargeDao.checkVendorChargeRejected(content_no);
            String reason;
            if (status == PointChargeType.REJECTED) {
                // 반려 상태일 때 반려사유
                reason = pointChargeRejectDao.getChargeRejectReason(content_no);
            } else if (status == PointChargeType.CANCEL_REQUEST || status == PointChargeType.CANCELED) {
                // 취소 요청 및 취소됨 일 때 취소 사유
                reason = pointChargeCancelDao.getChargeCancelReason(content_no);
            } else {
                // 그 외 상태일 때
                return new ResponseEntity(StringRes.res(StatusCode.POINT_STATUS_ERROR), HttpStatus.OK);
            }
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
        if (pointChargeDao.checkChargeAbleToCancel(request.getCharge_no())) {
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
        // 유저 코드 = user_no + 10000000, user_no = 유저 코드 - 10000000
        int user_no = PaybackRule.UserCodeCalculation(user_code, false);
        PaybackUserDataResponse response = userDao.getUserDataForPayback(user_no);
        if (response == null) {
            // 유저 정보 없을 때 U404
            return new ResponseEntity(StringRes.res(StatusCode.NO_USER_DETECTED), HttpStatus.OK);
        } else if (response.isUser_penalty()) {
            return new ResponseEntity(StringRes.res(StatusCode.PENALTY_USER), HttpStatus.OK);
        }
        message.put("user", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserDataForPayback()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity requestPayback(PaybackRequest request) throws JSONException {
        Message message = new Message();
        pointAccumulateDao.setSqlSession(sqlSession);
        notificationUserDao.setSqlSession(sqlSession);
        notificationVendorDao.setSqlSession(sqlSession);
        userDao.setSqlSession(sqlSession);
        vendorDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);

        // Original Store Data
        PointStoreDataResponse storePointData = storeDao.getStorePaybackData(request.getVendor_no());
        if (request.getPayback_rate() != storePointData.getPayback_rate()) {
            // 페이백률이 동일하지 않을 때 P402
            message.put("payback_rate", storePointData.getPayback_rate());
            return new ResponseEntity(StringRes.res(StatusCode.PAYBACK_RATE_DIFFERENT, message.getHashMap("requestPayback() - Payback Rate Different")), HttpStatus.OK);
        } else if (storePointData.getPoint() < request.getPoint()) {
            // 공급자의 포인트가 부족할 때 P403
            message.put("store_point", storePointData.getPoint());
            return new ResponseEntity(StringRes.res(StatusCode.NOT_ENOUGH_POINT, message.getHashMap("requestPayback() - Not Enough Point")), HttpStatus.OK);
        } else if (request.getPrice() >= PaybackRule.LIMIT_PRICE) {
            // 100만원 결제 한도가 넘었을 때 P404
            return new ResponseEntity(StringRes.res(StatusCode.PRICE_EXCEEDED, message.getHashMap("requestPayback() - Price amount Exceeded")), HttpStatus.OK);
        } else if (userDao.checkUserPenalty(request.getUser_no()) || vendorDao.checkVendorPenalty(request.getVendor_no())) {
            // 정지된 유저 및 정지된 공급자 일 떄 U501
            return new ResponseEntity(StringRes.res(StatusCode.PENALTY_USER, message.getHashMap("requestPayback() - User or Vendor is penalty")), HttpStatus.OK);
        } else if (PaybackRule.CalculatePoint(request.getPrice(), request.getPayback_rate(), request.getPoint())) {
            // 포인트 != 가격 * 페이백률이 다를 때 P405
            return new ResponseEntity(StringRes.res(StatusCode.POINT_RESULT_ERROR, message.getHashMap("requestPayback() - Point result is not match")), HttpStatus.OK);
        }
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

    @Transactional(readOnly = true)
    public ResponseEntity getUserPointForWithdrawPage(int user_no) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        // user_no, point
        UserWithdrawPageResponse response = userDao.getUserDataForWithdraw(user_no);
        if(response == null) {
            // 없는 유저면 U404
            return new ResponseEntity(StringRes.res(StatusCode.NO_USER_DETECTED), HttpStatus.OK);
        }
        message.put("user", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserPointForWithdrawPage()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity requestUserPointWithdraw(UserPointWithdrawRequest request) {
        userDao.setSqlSession(sqlSession);
        pointWithdrawDao.setSqlSession(sqlSession);
        int userPoint = userDao.getUserPoint(request.getUser_no());
        if(userPoint != request.getOriginal_point()) {
            // 서버 DB와 유저의 포인트 양이 다를 때 P407
            return new ResponseEntity(StringRes.res(StatusCode.POINT_NOT_MATCH), HttpStatus.OK);
        } else if (userPoint < request.getRequest_point()) {
            // 인출하는데 사용하는 포인트보다 보유 포인트가 적을 때 P403
            return new ResponseEntity(StringRes.res(StatusCode.NOT_ENOUGH_POINT), HttpStatus.OK);
        } else if (request.getRequest_point() < 1000) {
            // 인출 요청 금액이 1000 포인트 미만일 시 P408
            return new ResponseEntity(StringRes.res(StatusCode.LOWER_THAN_1000), HttpStatus.OK);
        }
        request.setReg_date(Time.TimeFormatHMS());
        // 인출 요청
        pointWithdrawDao.requestWithdraw(request);
        // 포인트 업데이트
        userDao.updatePointWithdraw(request);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }
}
