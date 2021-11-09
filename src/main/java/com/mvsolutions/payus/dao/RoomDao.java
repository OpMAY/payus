package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.RoomMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

//    private RoomMapper mapper = sqlSession.getMapper(RoomMapper.class);
}
