package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.mapper.PointChargeMapper;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointChargeRequest;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointChargeListResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PointChargeDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public void insertNewPointChargeRequest(VendorPointChargeRequest request, String now) {
        PointChargeMapper mapper = sqlSession.getMapper(PointChargeMapper.class);
        mapper.insertNewPointChargeRequest(request, now);
    }

    public List<VendorPointChargeListResponse> getVendorChargeList(int vendor_no) {
        PointChargeMapper mapper = sqlSession.getMapper(PointChargeMapper.class);
        return mapper.getVendorChargeList(vendor_no);
    }

    public List<VendorPointChargeListResponse> getVendorChargeListReload(int vendor_no, int last_index) {
        PointChargeMapper mapper = sqlSession.getMapper(PointChargeMapper.class);
        return mapper.getVendorChargeListReload(vendor_no, last_index);
    }

    public boolean checkChargeAbleToCancel(int charge_no) {
        PointChargeMapper mapper = sqlSession.getMapper(PointChargeMapper.class);
        return mapper.checkChargeAbleToCancel(charge_no);
    }

    public void chargeCancelRequestUpdate(int charge_no) {
        PointChargeMapper mapper = sqlSession.getMapper(PointChargeMapper.class);
        mapper.chargeCancelRequestUpdate(charge_no);
    }

    public void updateReadCheck(List<VendorPointChargeListResponse> chargeList) {
        PointChargeMapper mapper = sqlSession.getMapper(PointChargeMapper.class);
        mapper.updateReadCheck(chargeList);
    }

//    private PointChargeMapper mapper = sqlSession.getMapper(PointChargeMapper.class);
}
