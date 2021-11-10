package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.NotificationUserDao;
import com.mvsolutions.payus.dao.NotificationVendorDao;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationDeleteRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorNotificationResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
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


    @Transactional(readOnly = true)
    public ResponseEntity getVendorNotification(VendorNotificationRequest request) throws JSONException {
        Message message = new Message();
        notificationVendorDao.setSqlSession(sqlSession);
        // 초기 데이터 + 리로딩 모두 한 함수로 압축
        List<VendorNotificationResponse> notificationList = notificationVendorDao.getNotificationList(request);
        message.put("notification", notificationList);
        // Last_index 설정
        if (notificationList.size() > 0)
            message.put("last_index", notificationList.get(notificationList.size() - 1).getNotification_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getVendorNotification()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity deleteVendorNotification(VendorNotificationDeleteRequest request) {
        notificationVendorDao.setSqlSession(sqlSession);
        notificationVendorDao.deleteVendorNotification(request);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }
}
