package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.mapper.NoticeMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public int getLatestNoticeNo() {
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        return mapper.getLatestNoticeNo();
    }

//    private NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
}
