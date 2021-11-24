package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.NotificationUserMapper;
import com.mvsolutions.payus.mapper.NotificationVendorMapper;
import com.mvsolutions.payus.model.rest.basic.NotificationUser;
import com.mvsolutions.payus.model.rest.response.mainpage.UserNotificationResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NotificationUserDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    private NotificationUserMapper initMapper() {
        return sqlSession.getMapper(NotificationUserMapper.class);
    }

    public boolean checkUserNotificationUnread(int user_no) {
        NotificationUserMapper mapper = sqlSession.getMapper(NotificationUserMapper.class);
        return mapper.checkUserNotificationUnread(user_no);
    }

    public void insertNotification(NotificationUser notificationUser) {
        NotificationUserMapper mapper = sqlSession.getMapper(NotificationUserMapper.class);
        mapper.insertNotification(notificationUser);
    }

    public boolean checkUserNotificationExists(int last_index) {
        return initMapper().checkUserNotificationExists(last_index);
    }

    public List<UserNotificationResponse> getUserNotification(int user_no, int type) {
        return initMapper().getUserNotification(user_no, type);
    }

    public void updateReadCheck(List<UserNotificationResponse> notificationList) {
        initMapper().updateReadCheck(notificationList);
    }

    public List<UserNotificationResponse> getUserNotificationReload(int user_no, int type, int last_index) {
        return initMapper().getUserNotificationReload(user_no, type, last_index);
    }
}
