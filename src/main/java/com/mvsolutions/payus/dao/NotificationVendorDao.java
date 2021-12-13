package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.NotificationVendorMapper;
import com.mvsolutions.payus.model.rest.basic.NotificationVendor;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationDeleteRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorNotificationResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NotificationVendorDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    private NotificationVendorMapper mapper;

    private NotificationVendorMapper initMapper() {
        return sqlSession.getMapper(NotificationVendorMapper.class);
    }

    public List<VendorNotificationResponse> getNotificationListReload(int vendor_no, int type, int last_index) {
        NotificationVendorMapper mapper = sqlSession.getMapper(NotificationVendorMapper.class);
        return mapper.getNotificationListReload(vendor_no, type, last_index);
    }

    public void deleteVendorNotification(VendorNotificationDeleteRequest request) {
        NotificationVendorMapper mapper = sqlSession.getMapper(NotificationVendorMapper.class);
        mapper.deleteVendorNotification(request);
    }

    public void insertNotification(NotificationVendor notificationVendor) {
        initMapper().insertNotification(notificationVendor);
    }

    public List<VendorNotificationResponse> getNotificationList(int vendor_no, int type) {
        return initMapper().getNotificationList(vendor_no, type);
    }

    public void updateReadCheck(List<VendorNotificationResponse> notificationList) {
        initMapper().updateReadCheck(notificationList);
    }

    public boolean checkNotificationExists(int last_index) {
        return initMapper().checkNotificationExists(last_index);
    }

    public void updateByAnswerReview(int review_no) {
        initMapper().updateByAnswerReview(review_no);
    }

//    private NotificationVendorMapper mapper = sqlSession.getMapper(NotificationVendorMapper.class);
}
