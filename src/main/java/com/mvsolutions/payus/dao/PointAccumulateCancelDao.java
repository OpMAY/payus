package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointAccumulateCancelMapper;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointCancelRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointAccumulateCancelDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public void insertPointCancelRequest(VendorPointCancelRequest request) {
        PointAccumulateCancelMapper mapper = sqlSession.getMapper(PointAccumulateCancelMapper.class);
        mapper.insertPointCancelRequest(request);
    }


//    private PointAccumulateCancelMapper mapper = sqlSession.getMapper(PointAccumulateCancelMapper.class);
}
