package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.mapper.PointChargeCancelMapper;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorChargeCancelRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointChargeCancelDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public void insertChargeCancelRequest(VendorChargeCancelRequest request) {
        PointChargeCancelMapper mapper = sqlSession.getMapper(PointChargeCancelMapper.class);
        mapper.insertChargeCancelRequest(request);
    }

    public String getChargeCancelReason(int content_no) {
        PointChargeCancelMapper mapper = sqlSession.getMapper(PointChargeCancelMapper.class);
        return mapper.getChargeCancelReason(content_no);
    }

//    private PointChargeCancelMapper mapper = sqlSession.getMapper(PointChargeCancelMapper.class);
}
