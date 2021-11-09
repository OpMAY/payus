package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.ReportStoreMapper;
import com.mvsolutions.payus.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReportStoreDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

//    private ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
}
