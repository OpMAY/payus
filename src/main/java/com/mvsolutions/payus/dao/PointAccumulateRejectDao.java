package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.mapper.PointAccumulateCancelMapper;
import com.mvsolutions.payus.mapper.PointAccumulateRejectMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointAccumulateRejectDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public String getAccumulateRejectReason(int content_no) {
        PointAccumulateRejectMapper mapper = sqlSession.getMapper(PointAccumulateRejectMapper.class);
        return mapper.getAccumulateRejectReason(content_no);
    }
//    private PointAccumulateRejectMapper mapper = sqlSession.getMapper(PointAccumulateRejectMapper.class);
}
