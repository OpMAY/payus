package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.mvsolutions.payus.dao.StoreDao;
import com.mvsolutions.payus.dao.StoreOptionDao;
import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.exception.enums.BusinessExceptionType;
import com.mvsolutions.payus.exception.rest.GrantAccessDeniedException;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreOptionResponse;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusRequest;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusResponse;
import com.mvsolutions.payus.model.utility.kakaolocation.Documents;
import com.mvsolutions.payus.model.utility.kakaolocation.KakaoLocationResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.*;
import com.mvsolutions.payus.model.web.vendor.request.common.VendorPagingRequest;
import com.mvsolutions.payus.model.web.vendor.request.cs.VendorCustomerCenterFAQModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.cs.VendorCustomerCenterNoticeModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.cs.VendorStoreManagementInquiryModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminDeleteGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminEditGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminRegisterGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBankDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBusinessDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditPersonalDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.point.*;
import com.mvsolutions.payus.model.web.vendor.request.storemanagement.*;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorRegisterEmailResponse;
import com.mvsolutions.payus.model.web.vendor.response.cs.*;
import com.mvsolutions.payus.model.web.vendor.response.goodsmanagement.StoreGoods;
import com.mvsolutions.payus.model.web.vendor.response.goodsmanagement.VendorStoreManagementGoodsPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageBusinessInfo;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageInfo;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorSidebarDataResponse;
import com.mvsolutions.payus.model.web.vendor.response.point.*;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorAdminSalesList;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorSalesPageSummary;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorStoreManagementSalesPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.*;
import com.mvsolutions.payus.util.BusinessValidationService;
import com.mvsolutions.payus.util.EmailSendService;
import com.mvsolutions.payus.util.KakaoLocationService;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Log4j2
@Service
public class VendorAdminService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private VendorDao vendorDao;

    @Autowired
    private EmailSendService emailSendService;

    @Autowired
    private BusinessValidationService businessValidationService;

    @Autowired
    private KakaoLocationService kakaoLocationService;

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private StoreOptionDao storeOptionDao;

    @Transactional(readOnly = true)
    public VendorLoginResponse loginVendor(VendorLoginRequest request, HttpSession session) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkVendorExists(request)) {
            VendorLoginResponse response = vendorDao.loginVendor(request);
            session.setAttribute("vendor_no", response.getVendor_no());
            return response;
        } else {
            return new VendorLoginResponse(0);
        }
    }

    @Transactional(readOnly = true)
    public String findIdVendor(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.findIdVendor(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorFindIdResponse vendorFindIdPost(VendorFindIdRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorFindIdResponse response = vendorDao.vendorFindIdPost(request);
        if (response == null)
            return new VendorFindIdResponse(0);
        else
            return response;
    }

    @Transactional(readOnly = true)
    public VendorPasswordFindResponse findPassword(HttpServletResponse servletResponse, VendorFindPasswordRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorPasswordFindResponse response = vendorDao.findPassword(request);
        if (response.isId_exist()) {
            String validationCode = emailSendService.sendEmailForValidation(request.getId());
            response.setValidation_code(validationCode);
        }
        return response;
    }

    @Transactional(readOnly = true)
    public VendorPasswordFindResultData getPasswordFindResult(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getPasswordFindResult(vendor_no);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int resetPassword(VendorPasswordResetRequest request, HttpSession session) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkVendorCurrentPassword(request)) {
            return 1;
        }
        vendorDao.resetPassword(request);
        if (session != null) {
            session.removeAttribute("vendor_no");
        }
        return 0;
    }

    @Transactional(readOnly = true)
    public VendorRegisterEmailResponse validateEmail(VendorRegisterEmailRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkVendorExistsByEmail(request.getEmail())) {
            return new VendorRegisterEmailResponse("");
        } else {
            String validationCode = emailSendService.sendEmailForValidation(request.getEmail());
            return new VendorRegisterEmailResponse(validationCode);
        }
    }

    public int validateBusinessNumber(VendorBusinessValidateRequest request) throws IOException {
        ArrayList<String> businessNumberList = new ArrayList<>();
        businessNumberList.add(request.getBusiness_number().replaceAll("-", ""));
        BusinessStatusRequest statusRequest = new BusinessStatusRequest(businessNumberList);
        String status = businessValidationService.statusVerify(statusRequest);
        BusinessStatusResponse statusResponse = new Gson().fromJson(status, BusinessStatusResponse.class);
        if (statusResponse.getStatus_code().equals("OK")) {
            if (statusResponse.getData().get(0).getB_stt().equals("계속사업자") || statusResponse.getData().get(0).getB_stt_cd().equals("01")) {
                return 1;
            } else if (statusResponse.getData().get(0).getB_stt().equals("휴업자") || statusResponse.getData().get(0).getB_stt_cd().equals("02")) {
                return 2;
            } else if (statusResponse.getData().get(0).getB_stt().equals("폐업자") || statusResponse.getData().get(0).getB_stt_cd().equals("03")) {
                return 3;
            } else if (statusResponse.getData().get(0).getTax_type().equals("국세청에 등록되지 않은 사업자등록번호입니다.")) {
                return 4;
            }
        } else {
            return 0;
        }
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int registerVendorSkipped(VendorRegisterRequest request) {
        vendorDao.setSqlSession(sqlSession);
        request.setReg_date(Time.TimeFormatHMS());
        vendorDao.insertVendor(request);
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int registerVendorAll(VendorRegisterRequest vendorRegisterRequest, StoreRegisterRequest storeRegisterRequest) throws IOException, URISyntaxException {
        vendorDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);
        vendorDao.insertVendor(vendorRegisterRequest);
        storeRegisterRequest.setVendor_no(vendorRegisterRequest.getVendor_no());
        String result = kakaoLocationService.getLocationCoordinates(storeRegisterRequest.getAddress_road());
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        Documents documents = kakaoLocationResponse.getDocuments().get(0);
        double x = Double.parseDouble(documents.getX());
        double y = Double.parseDouble(documents.getY());
        storeRegisterRequest.setAddress_x(x);
        storeRegisterRequest.setAddress_y(y);
        if (documents.getAddress() != null) {
            storeRegisterRequest.setAddress_1depth(documents.getAddress().getRegion_1depth_name());
            storeRegisterRequest.setAddress_2depth(documents.getAddress().getRegion_2depth_name());
            storeRegisterRequest.setAddress_3depth(documents.getAddress().getRegion_3depth_name());
            storeRegisterRequest.setAddress_short(documents.getAddress().getRegion_1depth_name() + documents.getAddress().getRegion_2depth_name());
        } else if (documents.getRoad_address() != null) {
            storeRegisterRequest.setAddress_1depth(documents.getRoad_address().getRegion_1depth_name());
            storeRegisterRequest.setAddress_2depth(documents.getRoad_address().getRegion_2depth_name());
            storeRegisterRequest.setAddress_3depth(documents.getRoad_address().getRegion_3depth_name());
            storeRegisterRequest.setAddress_short(documents.getRoad_address().getRegion_1depth_name() + documents.getRoad_address().getRegion_2depth_name());
        }
        storeDao.registerStore(storeRegisterRequest);
        return 0;
    }

    @Transactional(readOnly = true)
    public VendorMyPageInfo getVendorInfoForMyPage(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorInfoForMyPage(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorMyPageBusinessInfo getVendorBusinessInfoForMyPage(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorBusinessInfoForMyPage(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementStoreInfo getVendorStoreInfoForStoreManagement(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorStoreInfoForStoreManagement(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementStoreDetailInfo getVendorStoreDetailForStoreManagement(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        storeOptionDao.setSqlSession(sqlSession);
        VendorStoreManagementStoreDetailInfo response = vendorDao.getVendorStoreDetailForStoreManagement(vendor_no);
        StoreOptionResponse option = storeOptionDao.getStoreOption(response.getStore_no());
        response.setInformation(option.getInformation());
        response.setService_list(option.getService_list());
        return response;
    }

    @Transactional(readOnly = true)
    public List<VendorStoreManagementReviewInfo> getVendorReviewListForStoreManagementInit(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorReviewListForStoreManagementInit(vendor_no);
    }

    @Transactional(readOnly = true)
    public List<StoreGoods> getVendorStoreGoodsList(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorStoreGoodsList(vendor_no);
    }

    @Transactional(readOnly = true)
    public int getPaybackRateForRegisterGoods(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getPaybackRateForRegisterGoods(vendor_no);
    }

    @Transactional(readOnly = true)
    public List<VendorAdminPointChargeList> getVendorAdminPointChargeList(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorAdminPointChargeList(vendor_no);
    }

    @Transactional(readOnly = true)
    public int getVendorPointChargeListNumber(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointChargeListNumber(vendor_no);
    }

    @Transactional(readOnly = true)
    public int getVendorPointValue(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointValue(vendor_no);
    }

    @Transactional(readOnly = true)
    public List<VendorAdminPointAccumulateList> getVendorAdminPointAccumulateList(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorAdminPointAccumulateList(vendor_no);
    }

    @Transactional(readOnly = true)
    public int getVendorPointAccumulateListNumber(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointAccumulateListNumber(vendor_no);
    }

    @Transactional(readOnly = true)
    public List<VendorAdminNoticeList> getNoticeList() {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getNoticeList();
    }

    @Transactional(readOnly = true)
    public int getNoticeNum() {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getNoticeNum();
    }

    @Transactional(readOnly = true)
    public List<VendorAdminFAQList> getFAQList() {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getFAQList();
    }

    @Transactional(readOnly = true)
    public int getFAQNum(int type) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getFAQNum(type);
    }

    @Transactional(readOnly = true)
    public boolean validateVendorPassword(int vendor_no, String password) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.validateVendorPassword(vendor_no, password);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public boolean changeVendorPersonalData(VendorAdminEditPersonalDataRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.changeVendorPersonalData(request);
        return true;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public boolean changeVendorBankData(VendorAdminEditBankDataRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.changeVendorBankData(request);
        return true;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public boolean changeVendorBusinessData(VendorAdminEditBusinessDataRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.changeVendorBusinessData(request);
        return true;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementReviewPagingResponse getReviewListCallDataByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementReviewPagingResponse response = new VendorStoreManagementReviewPagingResponse();
        response.setReviewList(vendorDao.getReviewListCallDataByPagination(request));
        response.setReview_num(vendorDao.getReviewNumberByDataType(request.getVendor_no(), request.getData_type()));
        return response;
    }

    @Transactional(readOnly = true)
    public int getVendorReviewNumber(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorReviewNumber(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementReviewDetail getReviewDetailForModal(VendorAdminReviewDetailRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getReviewDetailForModal(request);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public boolean answerReview(VendorAdminReviewAnswerRequest request) {
        vendorDao.setSqlSession(sqlSession);
        request.setAnswer_date(Time.TimeFormatHMS());
        vendorDao.answerReview(request);
        return true;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public boolean deleteGoods(VendorAdminDeleteGoodsRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.deleteRoom(request);
        return true;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int registerGoods(VendorAdminRegisterGoodsRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkGoodsNameExists(request.getGoods_name(), request.getVendor_no())) {
            // 이미 존재하는 상품 이름일 시 - 이름 중복 X
            return 1;
        }
        StoreGoods storeGoods = new StoreGoods();
        storeGoods.setName(request.getGoods_name());
        storeGoods.setGoods_explain(request.getGoods_explain());
        storeGoods.setPrice(request.getPrice());
        storeGoods.setReg_date(request.getReg_date());
        storeGoods.setImg(request.getGoods_img());
        storeGoods.setStore_no(request.getStore_no());
        vendorDao.registerGoods(storeGoods);
        return 0;
    }

    @Transactional(readOnly = true)
    public int getVendorStoreNo(Integer vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorStoreNo(vendor_no);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int editGoods(VendorAdminEditGoodsRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if (!vendorDao.checkGoodsNameSameByGoodsNo(request.getGoods_no(), request.getGoods_name())) {
            // 변경하려는 상품의 이름이 변경되었는지 확인
            if (vendorDao.checkGoodsNameExists(request.getGoods_name(), request.getVendor_no())) {
                // 변경하려는 상품의 이름이 변경되었지만, 다른 상품의 이름과 동일한 경우
                return 1;
            }
        }
        StoreGoods storeGoods = new StoreGoods();
        storeGoods.setGoods_no(request.getGoods_no());
        if (request.getGoods_img() != null)
            storeGoods.setImg(request.getGoods_img());
        storeGoods.setName(request.getGoods_name());
        storeGoods.setGoods_explain(request.getGoods_explain());
        storeGoods.setPrice(request.getPrice());
        vendorDao.updateGoods(storeGoods);
        return 0;
    }

    @Transactional(readOnly = true)
    public List<VendorAdminSalesList> getVendorSalesList(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorSalesList(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorSalesPageSummary getVendorSalesSummary(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorSalesSummary(vendor_no);
    }

    @Transactional(readOnly = true)
    public int getStoreGoodsNum(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorStoreGoodsNum(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementGoodsPagingResponse getGoodsListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        List<StoreGoods> storeGoods = vendorDao.getVendorStoreGoodsListByPagination(request);
        VendorStoreManagementGoodsPagingResponse response = new VendorStoreManagementGoodsPagingResponse();
        response.setGoodsList(storeGoods);
        response.setGoods_num(vendorDao.getVendorStoreGoodsNum(request.getVendor_no()));
        return response;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementPointChargePagingResponse getPointChargeListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementPointChargePagingResponse response = new VendorStoreManagementPointChargePagingResponse();
        List<VendorAdminPointChargeList> chargeList = vendorDao.getVendorPointChargeListByPaging(request);
        response.setChargeList(chargeList);
        response.setCharge_num(vendorDao.getChargeListNumberByDataType(request.getVendor_no(), request.getData_type()));
        return response;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementPointAccumulatePagingResponse getPointAccumulateListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementPointAccumulatePagingResponse response = new VendorStoreManagementPointAccumulatePagingResponse();
        List<VendorAdminPointAccumulateList> accumulateList = vendorDao.getVendorPointAccumulateListByPaging(request);
        response.setAccumulateList(accumulateList);
        response.setAccumulate_num(vendorDao.getAccumulateListNumberByDataType(request.getVendor_no(), request.getData_type()));
        return response;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementSalesPagingResponse getVendorSalesListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementSalesPagingResponse response = new VendorStoreManagementSalesPagingResponse();
        List<VendorAdminSalesList> salesList = vendorDao.getVendorSalesListByPaging(request);
        response.setSalesList(salesList);
        response.setSummary(vendorDao.getVendorSalesSummary(request.getVendor_no()));
        response.setSales_num(vendorDao.getVendorSalesNumByDataType(request.getVendor_no(), request.getData_type()));
        return response;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementNoticePagingResponse getNoticeListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementNoticePagingResponse response = new VendorStoreManagementNoticePagingResponse();
        response.setNotice_num(vendorDao.getNoticeNumByDataType(request));
        response.setNoticeList(vendorDao.getNoticeListByPaging(request));
        return response;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementFAQPagingResponse getFAQListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementFAQPagingResponse response = new VendorStoreManagementFAQPagingResponse();
        response.setFaq_num(vendorDao.getFAQNumByDataType(request));
        response.setFaqList(vendorDao.getFAQListByPaging(request));
        return response;
    }

    @Transactional(readOnly = true)
    public List<VendorAdminSalesList> getVendorSalesListAllForExcel(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorSalesListAllForExcel(vendor_no);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementPointChargeRejectInfo getVendorPointChargeRejectInfo(VendorPointChargeRejectModalRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointChargeRejectInfo(request);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementPointChargeCancelInfo getVendorPointChargeModalInfo(VendorPointChargeCancelModalRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointChargeModalInfo(request);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int cancelVendorPointCharge(VendorPointChargeCancelRequest request) {
        vendorDao.setSqlSession(sqlSession);
        int originalStatus = vendorDao.checkPointChargeStatus(request.getCharge_no());
        request.setReg_date(Time.TimeFormatHMS());
        vendorDao.updatePointChargeByCancel(request);
        if (originalStatus == 1) {
            return 0;
        } else {
            return 1;
        }
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementPointAccumulateReviewInfo getVendorPointAccumulateReviewInfo(VendorPointAccumulateReviewRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointAccumulateReviewInfo(request);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementPointAccumulateCancelRejectInfo getVendorPointAccumulateCancelRejectInfo(VendorPointAccumulateCancelRejectRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointAccumulateCancelRejectInfo(request);
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementPointAccumulateCancelInfo getVendorPointAccumulateCancelModalInfo(VendorPointAccumulateCancelModalRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointAccumulateCancelModalInfo(request);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int deleteVendorPointAccumulateCancel(VendorPointAccumulateCancelDeleteRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkPointAccumulateAlreadyCanceled(request.getAccumulate_no())) {
            // 철회 불가능할 때, status = 3이 아닐 때
            return 1;
        } else {
            vendorDao.updatePointAccumulateByDeleteCancel(request);
            return 0;
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int cancelVendorPointAccumulate(VendorPointAccumulateCancelRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkPointAccumulateAbleToCancel(request.getAccumulate_no())) {
            // Check Point Accumulate Able to Cancel -> if able to cancel, return true;
            request.setReg_date(Time.TimeFormatHMS());
            vendorDao.cancelPointAccumulate(request);
            return 0;
        } else {
            // Unable to cancel
            return 1;
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int answerReviewFromPointAccumulate(VendorPointAccumulateReviewAnswerRequest request) {
        vendorDao.setSqlSession(sqlSession);
        if (vendorDao.checkReviewAbleToAnswerForAccumulate(request.getAccumulate_no())) {
            // Check Review Able To Answer -> if able to answer, return true;
            request.setReg_date(Time.TimeFormatHMS());
            vendorDao.answerReviewFromPointAccumulate(request);
            return 0;
        } else {
            return 1;
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public VendorStoreManagementNoticeModalInfo getNoticeDataForModal(VendorCustomerCenterNoticeModalRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getNoticeDataForModal(request);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public VendorStoreManagementFAQModalInfo getFAQDataForModal(VendorCustomerCenterFAQModalRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getFAQDataForModal(request);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int editExplainFromStoreDetail(VendorStoreManagementDetailExplainEditRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.editExplainFromStoreDetail(request);
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int editStoreService(VendorStoreManagementDetailServiceEditRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.editStoreService(request);
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int editStoreInformation(VendorStoreManagementDetailInformationEditRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.editStoreInformation(request);
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int registerStoreService(VendorStoreManagementDetailServiceRegisterRequest request) {
        vendorDao.setSqlSession(sqlSession);
        request.setReg_date(Time.TimeFormatHMS());
        vendorDao.registerStoreService(request);
        return request.getService_no();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int registerStoreInformation(VendorStoreManagementDetailInformationRegisterRequest request) {
        vendorDao.setSqlSession(sqlSession);
        request.setReg_date(Time.TimeFormatHMS());
        vendorDao.registerStoreInformation(request);
        return request.getInformation_no();
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int deleteStoreService(VendorStoreManagementDetailServiceDeleteRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.deleteStoreService(request);
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int deleteStoreInformation(VendorStoreManagementDetailInformationDeleteRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.deleteStoreInformation(request);
        return 0;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int editStoreInfo(VendorStoreInfoEditRequest request) throws IOException, URISyntaxException {
        vendorDao.setSqlSession(sqlSession);
        String imageListString = vendorDao.getOriginalStoreImageList(request.getStore_no());
        List<String> imageList = new ArrayList<>(Arrays.asList(imageListString.replace("[", "").replace("]", "").replace("\"", "").split(", ")));
        log.info(imageList);
        log.info("list size : " + imageList.size());
        log.info("first Element : " + imageList.get(0));
        log.info("toString : " + imageList.toString());
        List<String> array = new ArrayList<>(imageList);
        log.info("Tojson : " + new Gson().toJson(array));
        // 받은 주소가 null 이 아니면 주소로 좌표 확인
        if (request.getRoad_address() != null) {
            String result = kakaoLocationService.getLocationCoordinates(request.getRoad_address());
            KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
            double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
            double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());
            request.setX(x);
            request.setY(y);
        }
        if (request.getDeleted_img_index().size() != 0) {
            for (Integer index : request.getDeleted_img_index()) {
                if (index != null)
                    imageList.remove((int) index);
            }
        }
        if (request.getNew_imgs().size() != 0) {
            imageList.addAll(request.getNew_imgs());
        }

        request.setImage_list(new Gson().toJson(imageList));
        vendorDao.editStoreInfo(request);

        return 0;
    }

    @Transactional(readOnly = true)
    public StoreGoods getGoodsInfo(int goods_no, int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        if(vendorDao.checkGoodsBelongToVendor(goods_no, vendor_no)){
            return vendorDao.getVendorStoreGoodsInfo(goods_no);
        } else {
            return null;
        }
    }

    @Transactional(readOnly = true)
    public List<VendorInquiryList> getVendorInquiryList(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorInquiryList(vendor_no);
    }

    @Transactional(readOnly = true)
    public int getVendorInquiryNum(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorInquiryNum(vendor_no);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int registerInquiry(VendorInquiryRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.requestInquiry(request);
        return 0;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementInquiryPagingResponse getInquiryListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementInquiryPagingResponse response = new VendorStoreManagementInquiryPagingResponse();
        response.setInquiryNum(vendorDao.getInquiryNumByDataType(request));
        response.setInquiryList(vendorDao.getInquiryListByPaging(request));
        return response;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementInquiryModalInfo getVendorInquiryModalInfo(VendorStoreManagementInquiryModalRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorInquiryModalInfo(request);
    }

    @Transactional(readOnly = true)
    public VendorSidebarDataResponse getVendorSidebarData(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorSidebarData(vendor_no);
    }
}
