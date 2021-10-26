package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.StoreLikeMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StoreLikeDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public boolean checkStoreLikeByUserNo(int store_no, int user_no) {
        StoreLikeMapper storeLikeMapper = sqlSession.getMapper(StoreLikeMapper.class);
        return storeLikeMapper.checkStoreLikeByUserNo(store_no, user_no) != null;
    }

    public boolean checkStoreLikeByVendorNo(int store_no, int vendor_no) {
        StoreLikeMapper storeLikeMapper = sqlSession.getMapper(StoreLikeMapper.class);
        return storeLikeMapper.checkStoreLikeByVendorNo(store_no, vendor_no) != null;
    }

    public void deleteUserStoreLike(int store_no, int user_no) {
        StoreLikeMapper storeLikeMapper = sqlSession.getMapper(StoreLikeMapper.class);
        storeLikeMapper.deleteUserStoreLike(store_no, user_no);
    }

    public void deleteVendorStoreLike(int store_no, int vendor_no) {
        StoreLikeMapper storeLikeMapper = sqlSession.getMapper(StoreLikeMapper.class);
        storeLikeMapper.deleteVendorStoreLike(store_no, vendor_no);
    }

    public void insertUserStoreLike(int store_no, int user_no) {
        StoreLikeMapper storeLikeMapper = sqlSession.getMapper(StoreLikeMapper.class);
        storeLikeMapper.insertUserStoreLike(store_no, user_no);
    }

    public void insertVendorStoreLike(int store_no, int vendor_no) {
        StoreLikeMapper storeLikeMapper = sqlSession.getMapper(StoreLikeMapper.class);
        storeLikeMapper.insertVendorStoreLike(store_no, vendor_no);
    }
}
