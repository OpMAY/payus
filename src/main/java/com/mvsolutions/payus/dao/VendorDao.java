package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.VendorMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class VendorDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

//    private VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
}
