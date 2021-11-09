package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointChargeRejectMapper;
import com.mvsolutions.payus.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointChargeRejectDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

//    private PointChargeRejectMapper mapper = sqlSession.getMapper(PointChargeRejectMapper.class);
}
