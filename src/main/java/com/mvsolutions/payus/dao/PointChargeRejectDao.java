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

    public String getChargeRejectReason(int content_no) {
        PointChargeRejectMapper mapper = sqlSession.getMapper(PointChargeRejectMapper.class);
        return mapper.getChargeRejectReason(content_no);
    }

//    private PointChargeRejectMapper mapper = sqlSession.getMapper(PointChargeRejectMapper.class);
}
