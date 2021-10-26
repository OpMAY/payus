package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.VendorMapper;
import com.mvsolutions.payus.model.demo.response.home.HomeVendor;
import com.mvsolutions.payus.model.demo.response.login.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.demo.response.setting.BankInfoEditRequest;
import com.mvsolutions.payus.model.demo.response.setting.VendorShortInfoResponse;
import com.mvsolutions.payus.model.demo.response.setting.VendorSpecificInfoResponse;
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

    public HomeVendor getVendorInfoByVendorNoForHome(int vendor_no){
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        return vendorMapper.getVendorInfoByVendorNoForHome(vendor_no);
    }

    public VendorLoginResponse loginVendor(String id, String password) {
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        return vendorMapper.loginVendor(id, password);
    }

    public VendorShortInfoResponse getVendorShortData(int vendor_no) {
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        return vendorMapper.getVendorShortData(vendor_no);
    }

    public boolean checkValidVendor(int vendor_no, String password) {
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        return vendorMapper.checkValidVendor(vendor_no, password);
    }

    public VendorSpecificInfoResponse getVendorProfile(int vendor_no) {
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        return vendorMapper.getVendorProfile(vendor_no);
    }

    public void updateVendorPersonal(int vendor_no, String phone) {
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        vendorMapper.updateVendorPersonal(vendor_no, phone);
    }

    public void updateVendorBank(int vendor_no, BankInfoEditRequest.BankInfoEditComponents bank) {
        VendorMapper vendorMapper = sqlSession.getMapper(VendorMapper.class);
        vendorMapper.updateVendorBank(vendor_no, bank);
    }
}
