package com.boot.demo.dao;

import com.boot.demo.mapper.VendorMapper;
import com.boot.demo.model.response.home.HomeVendor;
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

    public HomeVendor getUserInfoByUserNoForHome(int vendor_no){
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        return vendorMapper.getUserInfoByUserNoForHome(vendor_no);
    }
}
