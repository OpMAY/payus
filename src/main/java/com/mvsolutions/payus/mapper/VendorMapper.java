package com.mvsolutions.payus.mapper;


import com.mvsolutions.payus.model.rest.basic.Room;
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
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminRegisterGoodsRequest;
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

import java.util.List;

public interface VendorMapper {
    boolean checkVendorExists(VendorLoginRequest request);

    VendorLoginResponse loginVendor(VendorLoginRequest request);

    boolean checkVendorPenalty(int vendor_no);

    String getVendorName(int vendor_no);

    VendorHomeResponse getVendorHome(int vendor_no);

    SupPointChargeDataResponse getVendorPoint(int vendor_no);

    void requestPayback(PaybackRequest request);

    String getVendorFCMToken(int vendor_no);

    String findIdVendor(int vendor_no);

    VendorFindIdResponse vendorFindIdPost(VendorFindIdRequest request);

    VendorPasswordFindResponse findPassword(VendorFindPasswordRequest request);

    VendorPasswordFindResultData getPasswordFindResult(int vendor_no);

    boolean checkVendorCurrentPassword(VendorPasswordResetRequest request);

    void resetPassword(VendorPasswordResetRequest request);

    boolean checkVendorExistsByEmail(String email);

    void insertVendor(VendorRegisterRequest request);

    VendorMyPageInfo getVendorInfoForMyPage(int vendor_no);

    VendorMyPageBusinessInfo getVendorBusinessInfoForMyPage(int vendor_no);

    VendorStoreManagementStoreInfo getVendorStoreInfoForStoreManagement(int vendor_no);

    VendorStoreManagementStoreDetailInfo getVendorStoreDetailForStoreManagement(int vendor_no);

    List<VendorStoreManagementReviewInfo> getVendorReviewListForStoreManagementInit(int vendor_no);

    List<StoreGoods> getVendorStoreGoodsList(int vendor_no);

    StoreGoods getVendorStoreGoodsInfo(int goods_no);

    int getPaybackRateForRegisterGoods(int vendor_no);

    void updateVendorFCMToken(int vendor_no, String fcm_token);

    List<VendorAdminPointChargeList> getVendorAdminPointChargeList(int vendor_no);

    int getVendorPointChargeListNumber(int vendor_no);

    int getVendorPointValue(int vendor_no);

    List<VendorAdminPointAccumulateList> getVendorAdminPointAccumulateList(int vendor_no);

    int getVendorPointAccumulateListNumber(int vendor_no);

    List<VendorAdminNoticeList> getNoticeList();

    int getNoticeNum();

    List<VendorAdminFAQList> getFAQList();

    int getFAQNum(int type);

    boolean validateVendorPassword(int vendor_no, String password);

    void changeVendorPersonalData(VendorAdminEditPersonalDataRequest request);

    void changeVendorBankData(VendorAdminEditBankDataRequest request);

    void changeVendorBusinessData(VendorAdminEditBusinessDataRequest request);

    List<VendorStoreManagementReviewInfo> getReviewListCallDataByPagination(VendorPagingRequest request);

    int getVendorReviewNumber(int vendor_no);

    VendorStoreManagementReviewDetail getReviewDetailForModal(VendorAdminReviewDetailRequest request);

    int getReviewNumberByDataType(int vendor_no, int data_type);

    void answerReview(VendorAdminReviewAnswerRequest request);

    void deleteRoom(VendorAdminDeleteGoodsRequest request);

    int getVendorStoreType(int vendor_no);

    boolean checkGoodsNameExists(String goods_name, int vendor_no);

    void registerGoods(StoreGoods storeGoods);

    int getVendorStoreNo(int vendor_no);

    boolean checkGoodsNameSameByGoodsNo(int goods_no, String goods_name);

    void updateGoods(StoreGoods storeGoods);

    List<VendorAdminSalesList> getVendorSalesList(int vendor_no);

    VendorSalesPageSummary getVendorSalesSummary(int vendor_no);

    List<VendorAdminPointChargeList> getVendorPointChargeListByPaging(VendorPagingRequest request);

    int getChargeListNumberByDataType(int vendor_no, int data_type);

    List<VendorAdminPointAccumulateList> getVendorPointAccumulateListByPaging(VendorPagingRequest request);

    int getAccumulateListNumberByDataType(int vendor_no, int data_type);

    List<VendorAdminSalesList> getVendorSalesListByPaging(VendorPagingRequest request);

    int getVendorSalesNumByDataType(int vendor_no, int data_type);

    List<VendorAdminNoticeList> getNoticeListByPaging(VendorPagingRequest request);

    List<VendorAdminFAQList> getFAQListByPaging(VendorPagingRequest request);

    List<VendorAdminSalesList> getVendorSalesListAllForExcel(int vendor_no);

    VendorStoreManagementPointChargeRejectInfo getVendorPointChargeRejectInfo(VendorPointChargeRejectModalRequest request);

    VendorStoreManagementPointChargeCancelInfo getVendorPointChargeModalInfo(VendorPointChargeCancelModalRequest request);

    int checkPointChargeStatus(int charge_no);

    void insertChargeRequest(VendorPointChargeCancelRequest request);

    void updatePointChargeByCancel(VendorPointChargeCancelRequest request);

    VendorStoreManagementPointAccumulateReviewInfo getVendorPointAccumulateReviewInfo(VendorPointAccumulateReviewRequest request);

    VendorStoreManagementPointAccumulateCancelRejectInfo getVendorPointAccumulateCancelRejectInfo(VendorPointAccumulateCancelRejectRequest request);

    VendorStoreManagementPointAccumulateCancelInfo getVendorPointAccumulateCancelModalInfo(VendorPointAccumulateCancelModalRequest request);

    boolean checkPointAccumulateAlreadyCanceled(int accumulate_no);

    void updatePointAccumulateByDeleteCancel(VendorPointAccumulateCancelDeleteRequest request);

    boolean checkPointAccumulateAbleToCancel(int accumulate_no);

    void updatePointAccumulateByCancel(VendorPointAccumulateCancelRequest request);

    void insertPointAccumulateCancel(VendorPointAccumulateCancelRequest request);

    boolean checkReviewAbleToAnswerForAccumulate(int accumulate_no);

    void answerReviewFromPointAccumulate(VendorPointAccumulateReviewAnswerRequest request);

    void updateNoticeViewNum(VendorCustomerCenterNoticeModalRequest request);

    VendorStoreManagementNoticeModalInfo getNoticeDataForModal(VendorCustomerCenterNoticeModalRequest request);

    void updateFAQViewNum(VendorCustomerCenterFAQModalRequest request);

    VendorStoreManagementFAQModalInfo getFAQDataForModal(VendorCustomerCenterFAQModalRequest request);

    void editExplainFromStoreDetail(VendorStoreManagementDetailExplainEditRequest request);

    void editStoreService(VendorStoreManagementDetailServiceEditRequest request);

    void editStoreInformation(VendorStoreManagementDetailInformationEditRequest request);

    void registerStoreInformation(VendorStoreManagementDetailInformationRegisterRequest request);

    void registerStoreService(VendorStoreManagementDetailServiceRegisterRequest request);

    void deleteStoreService(VendorStoreManagementDetailServiceDeleteRequest request);

    void deleteStoreInformation(VendorStoreManagementDetailInformationDeleteRequest request);

    String getOriginalStoreImageList(int store_no);

    void editStoreInfo(VendorStoreInfoEditRequest request);

    List<StoreGoods> getVendorStoreGoodsListByPagination(VendorPagingRequest request);

    int getVendorStoreGoodsNum(int vendor_no);

    boolean checkGoodsBelongToVendor(int goods_no, int vendor_no);

    List<VendorInquiryList> getVendorInquiryList(int vendor_no);

    int getVendorInquiryNum(int vendor_no);

    void requestInquiry(VendorInquiryRequest request);

    int getInquiryNumByDataType(VendorPagingRequest request);

    List<VendorInquiryList> getInquiryListByPaging(VendorPagingRequest request);

    VendorStoreManagementInquiryModalInfo getVendorInquiryModalInfo(VendorStoreManagementInquiryModalRequest request);

    VendorSidebarDataResponse getVendorSidebarData(int vendor_no);

    int getNoticeNumByDataType(VendorPagingRequest request);

    int getFAQNumByDataType(VendorPagingRequest request);
}
