package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mvsolutions.payus.dao.StoreDao;
import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.model.rest.basic.Room;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusRequest;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusResponse;
import com.mvsolutions.payus.model.utility.kakaolocation.Documents;
import com.mvsolutions.payus.model.utility.kakaolocation.KakaoLocationResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.*;
import com.mvsolutions.payus.model.web.vendor.request.common.VendorPagingRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminDeleteGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminEditGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminRegisterGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBankDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBusinessDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditPersonalDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.point.VendorPointChargeCancelModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.point.VendorPointChargeRejectModalRequest;
import com.mvsolutions.payus.model.web.vendor.request.storemanagement.VendorAdminReviewAnswerRequest;
import com.mvsolutions.payus.model.web.vendor.request.storemanagement.VendorAdminReviewDetailRequest;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorRegisterEmailResponse;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorAdminFAQList;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorAdminNoticeList;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorStoreManagementFAQPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorStoreManagementNoticePagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.goodsmanagement.StoreGoods;
import com.mvsolutions.payus.model.web.vendor.response.goodsmanagement.VendorStoreManagementGoodsPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageBusinessInfo;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageInfo;
import com.mvsolutions.payus.model.web.vendor.response.point.*;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorAdminSalesList;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorSalesPageSummary;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorStoreManagementSalesPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.*;
import com.mvsolutions.payus.response.payus.StoreType;
import com.mvsolutions.payus.response.payus.vendor.GoodsType;
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
        return vendorDao.getVendorStoreDetailForStoreManagement(vendor_no);
    }

    @Transactional(readOnly = true)
    public List<VendorStoreManagementReviewInfo> getVendorReviewListForStoreManagementInit(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorReviewListForStoreManagementInit(vendor_no);
    }

    @Transactional(readOnly = true)
    public StoreGoods getVendorStoreGoodsList(int vendor_no, int goods_type) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorStoreGoodsList(vendor_no, goods_type);
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
        switch (request.getGoods_type()) {
            case GoodsType.ROOMS:
                vendorDao.deleteRoom(request);
                return true;
            case GoodsType.RESTAURANT_FOODS:
                log.info("식당 상품은 현재 지원하지 않는 상품입니다.");
                return false;
            case GoodsType.HOSPITAL_GOODS:
                log.info("병원 상품은 현재 지원하지 않는 상품입니다.");
                return false;
            case GoodsType.GROCERY_GOODS:
                log.info("식료품 상품은 현재 지원하지 않는 상품입니다.");
                return false;
            case GoodsType.SHOPPING_GOODS:
                log.info("쇼핑 상품은 현재 지원하지 않는 상품입니다.");
                return false;
            default:
                return false;
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int registerGoods(VendorAdminRegisterGoodsRequest request) {
        vendorDao.setSqlSession(sqlSession);
        int storeType = vendorDao.getVendorStoreType(request.getVendor_no());
        switch (storeType){
            case StoreType.LODGEMENT:
                if(vendorDao.checkRoomNameExists(request.getGoods_name(), request.getVendor_no())){
                    // 이미 존재하는 상품 이름일 시 - 이름 중복 X
                    return 1;
                }
                String roomKeyListString = vendorDao.getRoomKeyList(request.getStore_no());
                List<Integer> roomNoList = new Gson().fromJson(roomKeyListString, new TypeToken<List<Integer>>(){}.getType());
                Room room = new Room();
                if(roomNoList.size() > 0){
                    room.setRoom_no(roomNoList.get(roomNoList.size() - 1) + 1);
                } else {
                    room.setRoom_no(1);
                }
                room.setName(request.getGoods_name());
                room.setRoom_explain(request.getGoods_explain());
                room.setPrice(request.getPrice());
                room.setReg_date(request.getReg_date());
                room.setRoom_img(request.getGoods_img());
                vendorDao.registerRoom(room, request.getStore_no());
                return 0;
            case StoreType.RESTAURANT:
                log.info("식당 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            case StoreType.HOSPITAL:
                log.info("병원 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            case StoreType.GROCERY:
                log.info("식료품 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            case StoreType.SHOPPING:
                log.info("쇼핑 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            default:
                return -1;
        }
    }

    @Transactional(readOnly = true)
    public int getVendorStoreNo(Integer vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorStoreNo(vendor_no);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public int editGoods(VendorAdminEditGoodsRequest request) {
        vendorDao.setSqlSession(sqlSession);
        int storeType = vendorDao.getVendorStoreType(request.getVendor_no());
        switch (storeType){
            case StoreType.LODGEMENT:
                if(!vendorDao.checkRoomNameSameByRoomNo(request.getGoods_no() ,request.getGoods_name(), request.getStore_no())){
                    // 변경하려는 상품의 이름이 변경되었는지 확인
                    if(vendorDao.checkRoomNameExists(request.getGoods_name(), request.getVendor_no())) {
                        // 변경하려는 상품의 이름이 변경되었지만, 다른 상품의 이름과 동일한 경우
                        return 1;
                    }
                }
                Room room = new Room();
                room.setRoom_no(request.getGoods_no());
                if(request.getGoods_img() != null)
                    room.setRoom_img(request.getGoods_img());
                room.setName(request.getGoods_name());
                room.setRoom_explain(request.getGoods_explain());
                room.setPrice(request.getPrice());
                vendorDao.updateRoom(room, request.getOriginal_goods_name(), request.getStore_no());
                return 0;
            case StoreType.RESTAURANT:
                log.info("식당 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            case StoreType.HOSPITAL:
                log.info("병원 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            case StoreType.GROCERY:
                log.info("식료품 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            case StoreType.SHOPPING:
                log.info("쇼핑 상품은 현재 지원하지 않는 상품입니다.");
                return -1;
            default:
                return -1;
        }
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
    public VendorStoreManagementGoodsPagingResponse getGoodsListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        StoreGoods storeGoods = vendorDao.getVendorStoreGoodsList(request.getVendor_no(), GoodsType.ROOMS);
        VendorStoreManagementGoodsPagingResponse response = new VendorStoreManagementGoodsPagingResponse();
        response.setGoodsList(storeGoods);
        response.setGoods_num(storeGoods.getRoom_options().size());
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
        response.setNotice_num(vendorDao.getNoticeNum());
        response.setNoticeList(vendorDao.getNoticeListByPaging(request));
        return response;
    }

    @Transactional(readOnly = true)
    public VendorStoreManagementFAQPagingResponse getFAQListDataCallByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        VendorStoreManagementFAQPagingResponse response = new VendorStoreManagementFAQPagingResponse();
        response.setFaq_num(vendorDao.getFAQNum(request.getData_type() - 1));
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
}
