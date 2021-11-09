package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.ReviewMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

//    private ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
}
