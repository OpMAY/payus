package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.VendorMapper;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorHomeResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.SupPointChargeDataResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindIdRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindPasswordRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorPasswordResetRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorRegisterRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBankDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBusinessDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditPersonalDataRequest;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorAdminFAQList;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorAdminNoticeList;
import com.mvsolutions.payus.model.web.vendor.response.goodsmanagement.StoreGoods;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageBusinessInfo;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageInfo;
import com.mvsolutions.payus.model.web.vendor.response.point.VendorAdminPointAccumulateList;
import com.mvsolutions.payus.model.web.vendor.response.point.VendorAdminPointChargeList;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.VendorStoreManagementReviewInfo;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.VendorStoreManagementStoreDetailInfo;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.VendorStoreManagementStoreInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class VendorDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
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


    public VendorHomeResponse getVendorHome(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorHome(vendor_no);
    }

    public SupPointChargeDataResponse getVendorPoint(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPoint(vendor_no);
    }

    public void requestPayback(PaybackRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.requestPayback(request);
    }

    public String getVendorFCMToken(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorFCMToken(vendor_no);
    }

    public String findIdVendor(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.findIdVendor(vendor_no);
    }

    public VendorFindIdResponse vendorFindIdPost(VendorFindIdRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.vendorFindIdPost(request);
    }

    public VendorPasswordFindResponse findPassword(VendorFindPasswordRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.findPassword(request);
    }

    public VendorPasswordFindResultData getPasswordFindResult(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getPasswordFindResult(vendor_no);
    }

    public boolean checkVendorCurrentPassword(VendorPasswordResetRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkVendorCurrentPassword(request);
    }

    public void resetPassword(VendorPasswordResetRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.resetPassword(request);
    }

    public boolean checkVendorExistsByEmail(String email) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkVendorExistsByEmail(email);
    }

    public void insertVendor(VendorRegisterRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.insertVendor(request);
    }

    public VendorMyPageInfo getVendorInfoForMyPage(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorInfoForMyPage(vendor_no);
    }

    public VendorMyPageBusinessInfo getVendorBusinessInfoForMyPage(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorBusinessInfoForMyPage(vendor_no);
    }

    public VendorStoreManagementStoreInfo getVendorStoreInfoForStoreManagement(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreInfoForStoreManagement(vendor_no);
    }

    public VendorStoreManagementStoreDetailInfo getVendorStoreDetailForStoreManagement(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreDetailForStoreManagement(vendor_no);
    }

    public List<VendorStoreManagementReviewInfo> getVendorReviewListForStoreManagement(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorReviewListForStoreManagement(vendor_no);
    }

    public StoreGoods getVendorStoreGoodsList(int vendor_no, int goods_type) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreGoodsList(vendor_no, goods_type);
    }

    public int getPaybackRateForRegisterGoods(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getPaybackRateForRegisterGoods(vendor_no);
    }

    public void updateVendorFCMToken(int vendor_no, String fcm_token) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.updateVendorFCMToken(vendor_no, fcm_token);
    }

    public List<VendorAdminPointChargeList> getVendorAdminPointChargeList(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorAdminPointChargeList(vendor_no);
    }

    public int getVendorPointValue(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointValue(vendor_no);
    }

    public List<VendorAdminPointAccumulateList> getVendorAdminPointAccumulateList(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorAdminPointAccumulateList(vendor_no);
    }

    public List<VendorAdminNoticeList> getNoticeList() {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getNoticeList();
    }

    public List<VendorAdminFAQList> getFAQList() {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getFAQList();
    }

    public boolean validateVendorPassword(int vendor_no, String password) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.validateVendorPassword(vendor_no, password);
    }

    public void changeVendorPersonalData(VendorAdminEditPersonalDataRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.changeVendorPersonalData(request);
    }

    public void changeVendorBankData(VendorAdminEditBankDataRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.changeVendorBankData(request);
    }

    public void changeVendorBusinessData(VendorAdminEditBusinessDataRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.changeVendorBusinessData(request);
    }

//    private VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
}
