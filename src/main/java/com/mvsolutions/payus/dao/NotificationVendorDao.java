package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.NotificationVendorMapper;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationDeleteRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationRequest;
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

    public List<VendorNotificationResponse> getNotificationList(VendorNotificationRequest request) {
        NotificationVendorMapper mapper = sqlSession.getMapper(NotificationVendorMapper.class);
        return mapper.getNotificationList(request);
    }

    public void deleteVendorNotification(VendorNotificationDeleteRequest request) {
        NotificationVendorMapper mapper = sqlSession.getMapper(NotificationVendorMapper.class);
        mapper.deleteVendorNotification(request);
    }

//    private NotificationVendorMapper mapper = sqlSession.getMapper(NotificationVendorMapper.class);
}
