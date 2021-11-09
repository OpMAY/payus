package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.FavoriteMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

//    private FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
}
