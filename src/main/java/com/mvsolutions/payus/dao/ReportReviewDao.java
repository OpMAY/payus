package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.ReportReviewMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReportReviewDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

//    private ReportReviewMapper mapper = sqlSession.getMapper(ReportReviewMapper.class);
}
