package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.VendorMapper;
import com.mvsolutions.payus.model.rest.basic.Vendor;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorHomeRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorHomeResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.SupPointChargeDataResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import sun.misc.VM;

@Repository
public class VendorDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public boolean checkVendorExists(VendorLoginRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkVendorExists(request);
    }

    public VendorLoginResponse loginVendor(VendorLoginRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.loginVendor(request);
    }

    public boolean checkVendorPenalty(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkVendorPenalty(vendor_no);
    }

    public String getVendorName(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorName(vendor_no);
    }

    public VendorHomeResponse getVendorHome(VendorHomeRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorHome(request);
    }

    public SupPointChargeDataResponse getVendorPoint(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPoint(vendor_no);
    }

    public void requestPayback(PaybackRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.requestPayback(request);
    }

//    private VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
}
