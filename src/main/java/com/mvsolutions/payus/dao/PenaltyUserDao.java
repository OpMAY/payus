package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PenaltyUserMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PenaltyUserDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

//    private PenaltyUserMapper mapper = sqlSession.getMapper(PenaltyUserMapper.class);
}
