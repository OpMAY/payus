package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.mapper.NoticeMapper;
import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.NoticeResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    public boolean checkNoticeExists(int last_index) {
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        return mapper.checkNoticeExists(last_index);
    }

    public List<NoticeResponse> getNoticeList(int last_index) {
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        return mapper.getNoticeList(last_index);
    }

//    private NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
}
