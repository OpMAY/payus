package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.FAQMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FAQDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

//    private FAQMapper mapper = sqlSession.getMapper(FAQMapper.class);
}
