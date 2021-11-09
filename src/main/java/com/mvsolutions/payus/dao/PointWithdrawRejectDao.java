package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointWithdrawRejectMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointWithdrawRejectDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

//    private PointWithdrawRejectMapper mapper = sqlSession.getMapper(PointWithdrawRejectMapper.class);
}
