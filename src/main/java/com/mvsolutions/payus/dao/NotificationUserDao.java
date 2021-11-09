package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.NotificationUserMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NotificationUserDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public boolean checkUserNotificationUnread(int user_no) {
        NotificationUserMapper mapper = sqlSession.getMapper(NotificationUserMapper.class);
        return mapper.checkUserNotificationUnread(user_no);
    }
}
