package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.NotificationUserDao;
import com.mvsolutions.payus.dao.NotificationVendorDao;
import com.mvsolutions.payus.dao.UserDao;
import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.model.rest.basic.NotificationUser;
import com.mvsolutions.payus.model.rest.basic.NotificationVendor;
import com.mvsolutions.payus.model.rest.basic.UserNotificationDelete;
import com.mvsolutions.payus.model.rest.basic.UserPushData;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationDeleteRequest;
import com.mvsolutions.payus.model.rest.response.mainpage.UserNotificationResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorNotificationResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.notification.FCMTitle;
import com.mvsolutions.payus.response.payus.notification.NotificationUserType;
import com.mvsolutions.payus.response.payus.notification.NotificationVendorType;
import com.mvsolutions.payus.util.FCMUtil;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class NotificationService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private NotificationVendorDao notificationVendorDao;

    @Autowired
    private NotificationUserDao notificationUserDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private VendorDao vendorDao;

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getVendorNotification(int vendor_no) throws JSONException {
        Message message = new Message();
        notificationVendorDao.setSqlSession(sqlSession);
        // 종류 별 Notification
        List<VendorNotificationResponse> allNotificationList = notificationVendorDao.getNotificationList(vendor_no, NotificationVendorType.ALL);
        List<VendorNotificationResponse> warningNotificationList = notificationVendorDao.getNotificationList(vendor_no, NotificationVendorType.WARNING);
        List<VendorNotificationResponse> pointNotificationList = notificationVendorDao.getNotificationList(vendor_no, NotificationVendorType.POINT);
        List<VendorNotificationResponse> eventNotificationList = notificationVendorDao.getNotificationList(vendor_no, NotificationVendorType.EVENT);
        List<VendorNotificationResponse> reviewNotificationList = notificationVendorDao.getNotificationList(vendor_no, NotificationVendorType.REVIEW);
        List<VendorNotificationResponse> etcNotificationList = notificationVendorDao.getNotificationList(vendor_no, NotificationVendorType.ETC);
        message.put("notification0", allNotificationList);
        message.put("notification1", warningNotificationList);
        message.put("notification2", pointNotificationList);
        message.put("notification3", eventNotificationList);
        message.put("notification4", reviewNotificationList);
        message.put("notification5", etcNotificationList);
        // Last_index 설정
        if (allNotificationList.size() > 0) {
            notificationVendorDao.updateReadCheck(allNotificationList);
            message.put("last_index0", allNotificationList.get(allNotificationList.size() - 1).getNotification_no());
        }
        if (warningNotificationList.size() > 0) {
            notificationVendorDao.updateReadCheck(warningNotificationList);
            message.put("last_index1", warningNotificationList.get(warningNotificationList.size() - 1).getNotification_no());
        }
        if (pointNotificationList.size() > 0) {
            notificationVendorDao.updateReadCheck(pointNotificationList);
            message.put("last_index2", pointNotificationList.get(pointNotificationList.size() - 1).getNotification_no());
        }
        if (eventNotificationList.size() > 0) {
            notificationVendorDao.updateReadCheck(eventNotificationList);
            message.put("last_index3", eventNotificationList.get(eventNotificationList.size() - 1).getNotification_no());
        }
        if (reviewNotificationList.size() > 0) {
            notificationVendorDao.updateReadCheck(reviewNotificationList);
            message.put("last_index4", reviewNotificationList.get(reviewNotificationList.size() - 1).getNotification_no());
        }
        if (etcNotificationList.size() > 0) {
            notificationVendorDao.updateReadCheck(etcNotificationList);
            message.put("last_index5", etcNotificationList.get(etcNotificationList.size() - 1).getNotification_no());
        }

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorNotification()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getVendorNotificationReload(int vendor_no, int type, int last_index) throws JSONException {
        Message message = new Message();
        notificationVendorDao.setSqlSession(sqlSession);
        if (!notificationVendorDao.checkNotificationExists(last_index)) {
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }
        List<VendorNotificationResponse> notificationList = notificationVendorDao.getNotificationListReload(vendor_no, type, last_index);
        message.put("notification", notificationList);
        if (notificationList.size() > 0) {
            notificationVendorDao.updateReadCheck(notificationList);
            message.put("last_index", notificationList.get(notificationList.size() - 1).getNotification_no());
        }

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorNotificationReload()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity deleteVendorNotification(VendorNotificationDeleteRequest request) {
        notificationVendorDao.setSqlSession(sqlSession);
        notificationVendorDao.deleteVendorNotification(request);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void sendNotification(NotificationUser notificationUser, NotificationVendor notificationVendor) {
        if (notificationUser != null) {
            // 유저에게 알림
            notificationUserDao.setSqlSession(sqlSession);
            userDao.setSqlSession(sqlSession);
            UserPushData pushData = userDao.getUserPushData(notificationUser.getUser_no());
            notificationUserDao.insertNotification(notificationUser);
            boolean canSend;
            switch (notificationUser.getType()) {
                case NotificationUserType.WARNING:
                    canSend = pushData.isReport_push();
                    break;
                case NotificationUserType.PAYBACK:
                case NotificationUserType.POINT:
                    canSend = pushData.isPoint_push();
                    break;
                case NotificationUserType.EVENT:
                    canSend = pushData.isEvent_push();
                    break;
                case NotificationUserType.REVIEW:
                    canSend = pushData.isReview_push();
                    break;
                default:
                    canSend = false;
                    break;
            }
            String fcm_token = userDao.getUserFCMToken(notificationUser.getUser_no());
            if (fcm_token != null && canSend) {
                if (FCMUtil.sendFCMMessage(fcm_token, FCMTitle.getFCMTitle(notificationUser.getType(), true), notificationUser.getContent(), notificationUser.getNotification_json())) {
                    log.info("FCM Notification Send Success");
                }
            } else if (!canSend) {
                log.info("Push Setting is OFF");
            } else {
                log.info("FCM TOKEN IS NULL");
            }
        }
        if (notificationVendor != null) {
            // 공급자에게 알림
            notificationVendorDao.setSqlSession(sqlSession);
            vendorDao.setSqlSession(sqlSession);
            notificationVendorDao.insertNotification(notificationVendor);
            String fcm_token = vendorDao.getVendorFCMToken(notificationVendor.getVendor_no());
            if (fcm_token != null) {
                if (FCMUtil.sendFCMMessage(fcm_token, FCMTitle.getFCMTitle(notificationVendor.getType(), false), notificationVendor.getContent(), notificationVendor.getNotification_json())) {
                    log.info("FCM Notification Send Success");
                }
            } else {
                log.info("FCM TOKEN IS NULL");
            }
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getUserNotification(int user_no) throws JSONException {
        Message message = new Message();
        notificationUserDao.setSqlSession(sqlSession);
        // 종류 별 알림 리스트
        List<UserNotificationResponse> allNotificationList = notificationUserDao.getUserNotification(user_no, NotificationUserType.ALL);
        List<UserNotificationResponse> warningNotificationList = notificationUserDao.getUserNotification(user_no, NotificationUserType.WARNING);
        List<UserNotificationResponse> paybackNotificationList = notificationUserDao.getUserNotification(user_no, NotificationUserType.PAYBACK);
        List<UserNotificationResponse> pointNotificationList = notificationUserDao.getUserNotification(user_no, NotificationUserType.POINT);
        List<UserNotificationResponse> eventNotificationList = notificationUserDao.getUserNotification(user_no, NotificationUserType.EVENT);
        List<UserNotificationResponse> reviewNotificationList = notificationUserDao.getUserNotification(user_no, NotificationUserType.REVIEW);
        List<UserNotificationResponse> etcNotificationList = notificationUserDao.getUserNotification(user_no, NotificationUserType.ETC);
        message.put("notification0", allNotificationList);
        message.put("notification1", warningNotificationList);
        message.put("notification2", paybackNotificationList);
        message.put("notification3", pointNotificationList);
        message.put("notification4", eventNotificationList);
        message.put("notification5", reviewNotificationList);
        message.put("notification6", etcNotificationList);

        if (allNotificationList.size() > 0) {
            notificationUserDao.updateReadCheck(allNotificationList);
            message.put("last_index0", allNotificationList.get(allNotificationList.size() - 1).getNotification_no());
        }
        if (warningNotificationList.size() > 0) {
            notificationUserDao.updateReadCheck(warningNotificationList);
            message.put("last_index1", warningNotificationList.get(warningNotificationList.size() - 1).getNotification_no());
        }
        if (paybackNotificationList.size() > 0) {
            notificationUserDao.updateReadCheck(paybackNotificationList);
            message.put("last_index2", paybackNotificationList.get(paybackNotificationList.size() - 1).getNotification_no());
        }
        if (pointNotificationList.size() > 0) {
            notificationUserDao.updateReadCheck(pointNotificationList);
            message.put("last_index3", pointNotificationList.get(pointNotificationList.size() - 1).getNotification_no());
        }
        if (eventNotificationList.size() > 0) {
            notificationUserDao.updateReadCheck(eventNotificationList);
            message.put("last_index4", eventNotificationList.get(eventNotificationList.size() - 1).getNotification_no());
        }
        if (reviewNotificationList.size() > 0) {
            notificationUserDao.updateReadCheck(reviewNotificationList);
            message.put("last_index5", reviewNotificationList.get(reviewNotificationList.size() - 1).getNotification_no());
        }
        if (etcNotificationList.size() > 0) {
            notificationUserDao.updateReadCheck(etcNotificationList);
            message.put("last_index6", etcNotificationList.get(etcNotificationList.size() - 1).getNotification_no());
        }

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserNotification()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getUserNotificationReload(int user_no, int type, int last_index) throws JSONException {
        Message message = new Message();
        notificationUserDao.setSqlSession(sqlSession);
        if (!notificationUserDao.checkUserNotificationExists(last_index)) {
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }
        List<UserNotificationResponse> notificationList = notificationUserDao.getUserNotificationReload(user_no, type, last_index);
        message.put("notification", notificationList);
        if (notificationList.size() > 0) {
            notificationUserDao.updateReadCheck(notificationList);
            message.put("last_index", notificationList.get(notificationList.size() - 1).getNotification_no());
        }


        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserNotificationReload()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity deleteUserNotification(UserNotificationDelete request) {
        notificationUserDao.setSqlSession(sqlSession);
        notificationUserDao.deleteUserNotification(request);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

}
