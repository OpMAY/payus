package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointWithdrawMapper;
import com.mvsolutions.payus.model.rest.request.usermypage.UserPointWithdrawRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointWithdrawDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public void requestWithdraw(UserPointWithdrawRequest request) {
        PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
        mapper.requestWithdraw(request);
    }

//    private PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
}
