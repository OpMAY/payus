package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.StoreLodgementMapper;
import com.mvsolutions.payus.mapper.UserMapper;
import com.mvsolutions.payus.model.rest.basic.StoreLodgement;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StoreLodgementDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public void insertLodgement(StoreLodgement storeLodgement) {
        StoreLodgementMapper mapper = sqlSession.getMapper(StoreLodgementMapper.class);
        mapper.insertLodgement(storeLodgement);
    }
}
