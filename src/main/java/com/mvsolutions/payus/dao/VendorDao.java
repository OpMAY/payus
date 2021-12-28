package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.VendorMapper;
import com.mvsolutions.payus.model.rest.basic.Vendor;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorHomeResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.SupPointChargeDataResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindIdRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindPasswordRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorPasswordResetRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorRegisterRequest;
import com.mvsolutions.payus.model.web.vendor.request.common.VendorPagingRequest;
import com.mvsolutions.payus.model.web.vendor.request.cs.VendorCustomerCenterFAQModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.cs.VendorCustomerCenterNoticeModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.cs.VendorStoreManagementInquiryModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminDeleteGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBankDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBusinessDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditPersonalDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.point.*;
import com.mvsolutions.payus.model.web.vendor.request.storemanagement.*;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.model.web.vendor.response.cs.*;
import com.mvsolutions.payus.model.web.vendor.response.goodsmanagement.StoreGoods;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageBusinessInfo;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageInfo;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorSidebarDataResponse;
import com.mvsolutions.payus.model.web.vendor.response.point.*;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorAdminSalesList;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorSalesPageSummary;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.VendorStoreManagementReviewDetail;
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

    public List<VendorStoreManagementReviewInfo> getVendorReviewListForStoreManagementInit(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorReviewListForStoreManagementInit(vendor_no);
    }

    public List<StoreGoods> getVendorStoreGoodsList(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreGoodsList(vendor_no);
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

    public int getVendorPointChargeListNumber(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointChargeListNumber(vendor_no);
    }

    public int getVendorPointValue(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointValue(vendor_no);
    }

    public List<VendorAdminPointAccumulateList> getVendorAdminPointAccumulateList(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorAdminPointAccumulateList(vendor_no);
    }

    public int getVendorPointAccumulateListNumber(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointAccumulateListNumber(vendor_no);
    }

    public List<VendorAdminNoticeList> getNoticeList() {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getNoticeList();
    }

    public int getNoticeNum() {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getNoticeNum();
    }

    public List<VendorAdminFAQList> getFAQList() {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getFAQList();
    }

    public int getFAQNum(int type) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getFAQNum(type);
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

    public List<VendorStoreManagementReviewInfo> getReviewListCallDataByPagination(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getReviewListCallDataByPagination(request);
    }

    public int getVendorReviewNumber(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorReviewNumber(vendor_no);
    }

    public VendorStoreManagementReviewDetail getReviewDetailForModal(VendorAdminReviewDetailRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getReviewDetailForModal(request);
    }

    public int getReviewNumberByDataType(int vendor_no, int data_type) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getReviewNumberByDataType(vendor_no, data_type);
    }

    public void answerReview(VendorAdminReviewAnswerRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.answerReview(request);
    }

    public void deleteRoom(VendorAdminDeleteGoodsRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.deleteRoom(request);
    }

    public int getVendorStoreType(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreType(vendor_no);
    }

    public boolean checkGoodsNameExists(String goods_name, int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkGoodsNameExists(goods_name, vendor_no);
    }

    public void registerGoods(StoreGoods storeGoods) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.registerGoods(storeGoods);
    }

    public int getVendorStoreNo(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreNo(vendor_no);
    }

    public boolean checkGoodsNameSameByGoodsNo(int goods_no, String goods_name) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkGoodsNameSameByGoodsNo(goods_no, goods_name);
    }

    public void updateGoods(StoreGoods storeGoods) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.updateGoods(storeGoods);
    }

    public List<VendorAdminSalesList> getVendorSalesList(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorSalesList(vendor_no);
    }

    public VendorSalesPageSummary getVendorSalesSummary(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorSalesSummary(vendor_no);
    }

    public List<VendorAdminPointChargeList> getVendorPointChargeListByPaging(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointChargeListByPaging(request);
    }

    public int getChargeListNumberByDataType(int vendor_no, int data_type) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getChargeListNumberByDataType(vendor_no, data_type);
    }

    public List<VendorAdminPointAccumulateList> getVendorPointAccumulateListByPaging(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointAccumulateListByPaging(request);
    }

    public int getAccumulateListNumberByDataType(int vendor_no, int data_type) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getAccumulateListNumberByDataType(vendor_no, data_type);
    }

    public List<VendorAdminSalesList> getVendorSalesListByPaging(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorSalesListByPaging(request);
    }

    public int getVendorSalesNumByDataType(int vendor_no, int data_type) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorSalesNumByDataType(vendor_no, data_type);
    }

    public List<VendorAdminNoticeList> getNoticeListByPaging(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getNoticeListByPaging(request);
    }

    public List<VendorAdminFAQList> getFAQListByPaging(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getFAQListByPaging(request);
    }

    public List<VendorAdminSalesList> getVendorSalesListAllForExcel(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorSalesListAllForExcel(vendor_no);
    }

    public VendorStoreManagementPointChargeRejectInfo getVendorPointChargeRejectInfo(VendorPointChargeRejectModalRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointChargeRejectInfo(request);
    }

    public VendorStoreManagementPointChargeCancelInfo getVendorPointChargeModalInfo(VendorPointChargeCancelModalRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointChargeModalInfo(request);
    }

    public int checkPointChargeStatus(int charge_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkPointChargeStatus(charge_no);
    }

    public void updatePointChargeByCancel(VendorPointChargeCancelRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.insertChargeRequest(request);
        mapper.updatePointChargeByCancel(request);
    }

    public VendorStoreManagementPointAccumulateReviewInfo getVendorPointAccumulateReviewInfo(VendorPointAccumulateReviewRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointAccumulateReviewInfo(request);
    }

    public VendorStoreManagementPointAccumulateCancelRejectInfo getVendorPointAccumulateCancelRejectInfo(VendorPointAccumulateCancelRejectRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointAccumulateCancelRejectInfo(request);
    }

    public VendorStoreManagementPointAccumulateCancelInfo getVendorPointAccumulateCancelModalInfo(VendorPointAccumulateCancelModalRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorPointAccumulateCancelModalInfo(request);
    }

    public boolean checkPointAccumulateAlreadyCanceled(int accumulate_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkPointAccumulateAlreadyCanceled(accumulate_no);
    }

    public void updatePointAccumulateByDeleteCancel(VendorPointAccumulateCancelDeleteRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.updatePointAccumulateByDeleteCancel(request);
    }

    public boolean checkPointAccumulateAbleToCancel(int accumulate_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkPointAccumulateAbleToCancel(accumulate_no);
    }

    public void cancelPointAccumulate(VendorPointAccumulateCancelRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.updatePointAccumulateByCancel(request);
        mapper.insertPointAccumulateCancel(request);
    }

    public boolean checkReviewAbleToAnswerForAccumulate(int accumulate_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkReviewAbleToAnswerForAccumulate(accumulate_no);
    }

    public void answerReviewFromPointAccumulate(VendorPointAccumulateReviewAnswerRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.answerReviewFromPointAccumulate(request);
    }

    public VendorStoreManagementNoticeModalInfo getNoticeDataForModal(VendorCustomerCenterNoticeModalRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.updateNoticeViewNum(request);
        return mapper.getNoticeDataForModal(request);
    }

    public VendorStoreManagementFAQModalInfo getFAQDataForModal(VendorCustomerCenterFAQModalRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.updateFAQViewNum(request);
        return mapper.getFAQDataForModal(request);
    }

    public void editExplainFromStoreDetail(VendorStoreManagementDetailExplainEditRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.editExplainFromStoreDetail(request);
    }

    public void editStoreService(VendorStoreManagementDetailServiceEditRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.editStoreService(request);
    }

    public void editStoreInformation(VendorStoreManagementDetailInformationEditRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.editStoreInformation(request);
    }

    public void registerStoreInformation(VendorStoreManagementDetailInformationRegisterRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.registerStoreInformation(request);
    }

    public void registerStoreService(VendorStoreManagementDetailServiceRegisterRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.registerStoreService(request);
    }

    public void deleteStoreService(VendorStoreManagementDetailServiceDeleteRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.deleteStoreService(request);
    }

    public void deleteStoreInformation(VendorStoreManagementDetailInformationDeleteRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.deleteStoreInformation(request);
    }

    public String getOriginalStoreImageList(int store_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getOriginalStoreImageList(store_no);
    }

    public void editStoreInfo(VendorStoreInfoEditRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.editStoreInfo(request);
    }

    public StoreGoods getVendorStoreGoodsInfo(int goods_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreGoodsInfo(goods_no);
    }

    public List<StoreGoods> getVendorStoreGoodsListByPagination(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreGoodsListByPagination(request);
    }

    public int getVendorStoreGoodsNum(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorStoreGoodsNum(vendor_no);
    }

    public boolean checkGoodsBelongToVendor(int goods_no, int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.checkGoodsBelongToVendor(goods_no, vendor_no);
    }

    public List<VendorInquiryList> getVendorInquiryList(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorInquiryList(vendor_no);
    }

    public int getVendorInquiryNum(int vendor_no){
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorInquiryNum(vendor_no);
    }

    public void requestInquiry(VendorInquiryRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        mapper.requestInquiry(request);
    }

    public int getInquiryNumByDataType(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getInquiryNumByDataType(request);
    }

    public List<VendorInquiryList> getInquiryListByPaging(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getInquiryListByPaging(request);
    }

    public VendorStoreManagementInquiryModalInfo getVendorInquiryModalInfo(VendorStoreManagementInquiryModalRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorInquiryModalInfo(request);
    }

    public VendorSidebarDataResponse getVendorSidebarData(int vendor_no) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getVendorSidebarData(vendor_no);
    }

    public int getNoticeNumByDataType(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getNoticeNumByDataType(request);
    }

    public int getFAQNumByDataType(VendorPagingRequest request) {
        VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
        return mapper.getFAQNumByDataType(request);
    }

//    private VendorMapper mapper = sqlSession.getMapper(VendorMapper.class);
}
