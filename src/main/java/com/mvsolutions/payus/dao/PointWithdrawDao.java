package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointWithdrawMapper;
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

//    private PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
}
