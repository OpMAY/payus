package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.mapper.PenaltyVendorMapper;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorPenaltyResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PenaltyVendorDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<VendorPenaltyResponse> getVendorPenaltyInfo(int vendor_no) {
        PenaltyVendorMapper mapper = sqlSession.getMapper(PenaltyVendorMapper.class);
        return mapper.getVendorPenaltyInfo(vendor_no);
    }

//    private PenaltyVendorMapper mapper = sqlSession.getMapper(PenaltyVendorMapper.class);
}
