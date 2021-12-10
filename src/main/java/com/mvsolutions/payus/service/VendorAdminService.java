package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.mvsolutions.payus.dao.StoreDao;
import com.mvsolutions.payus.dao.VendorDao;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusRequest;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusResponse;
import com.mvsolutions.payus.model.utility.kakaolocation.Documents;
import com.mvsolutions.payus.model.utility.kakaolocation.KakaoLocationResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.*;
import com.mvsolutions.payus.model.web.vendor.request.common.VendorPagingRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBankDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBusinessDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditPersonalDataRequest;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorRegisterEmailResponse;
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
import com.mvsolutions.payus.util.BusinessValidationService;
import com.mvsolutions.payus.util.EmailSendService;
import com.mvsolutions.payus.util.KakaoLocationService;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;
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

@Log4j
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
        if(session != null) {
            session.removeAttribute("vendor_no");
        }
        return 0;
    }

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

    public StoreGoods getVendorStoreGoodsList(int vendor_no, int goods_type) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorStoreGoodsList(vendor_no, goods_type);
    }

    public int getPaybackRateForRegisterGoods(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getPaybackRateForRegisterGoods(vendor_no);
    }

    public List<VendorAdminPointChargeList> getVendorAdminPointChargeList(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorAdminPointChargeList(vendor_no);
    }

    public int getVendorPointValue(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorPointValue(vendor_no);
    }

    public List<VendorAdminPointAccumulateList> getVendorAdminPointAccumulateList(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorAdminPointAccumulateList(vendor_no);
    }

    public List<VendorAdminNoticeList> getNoticeList() {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getNoticeList();
    }

    public List<VendorAdminFAQList> getFAQList() {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getFAQList();
    }

    public boolean validateVendorPassword(int vendor_no, String password) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.validateVendorPassword(vendor_no, password);
    }

    public boolean changeVendorPersonalData(VendorAdminEditPersonalDataRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.changeVendorPersonalData(request);
        return true;
    }

    public boolean changeVendorBankData(VendorAdminEditBankDataRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.changeVendorBankData(request);
        return true;
    }

    public boolean changeVendorBusinessData(VendorAdminEditBusinessDataRequest request) {
        vendorDao.setSqlSession(sqlSession);
        vendorDao.changeVendorBusinessData(request);
        return true;
    }

    public List<VendorStoreManagementReviewInfo> getReviewListCallDataByPagination(VendorPagingRequest request) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getReviewListCallDataByPagination(request);
    }

    public int getVendorReviewNumber(int vendor_no) {
        vendorDao.setSqlSession(sqlSession);
        return vendorDao.getVendorReviewNumber(vendor_no);
    }
}
