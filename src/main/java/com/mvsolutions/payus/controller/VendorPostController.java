package com.mvsolutions.payus.controller;

import com.google.api.Http;
import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.*;
import com.mvsolutions.payus.model.web.vendor.request.common.VendorPagingRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminDeleteGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminEditGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.goodsmanagement.VendorAdminRegisterGoodsRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBankDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditBusinessDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorAdminEditPersonalDataRequest;
import com.mvsolutions.payus.model.web.vendor.request.mypage.VendorPasswordValidationRequest;
import com.mvsolutions.payus.model.web.vendor.request.point.*;
import com.mvsolutions.payus.model.web.vendor.request.storemanagement.VendorAdminReviewAnswerRequest;
import com.mvsolutions.payus.model.web.vendor.request.storemanagement.VendorAdminReviewDetailRequest;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorRegisterEmailResponse;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorStoreManagementFAQPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.cs.VendorStoreManagementNoticePagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.goodsmanagement.VendorStoreManagementGoodsPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.point.*;
import com.mvsolutions.payus.model.web.vendor.response.sales.VendorStoreManagementSalesPagingResponse;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.VendorStoreManagementReviewDetail;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.VendorStoreManagementReviewInfo;
import com.mvsolutions.payus.model.web.vendor.response.storemanagement.VendorStoreManagementReviewPagingResponse;
import com.mvsolutions.payus.service.VendorAdminService;
import com.mvsolutions.payus.util.Constant;
import com.mvsolutions.payus.util.FileUploadUtility;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Log4j2
@RestController
@RequestMapping(value = "/vendor", method = RequestMethod.POST)
public class VendorPostController {
    @Autowired
    private VendorAdminService vendorAdminService;

    @Autowired
    private FileUploadUtility fileUploadUtility;

    @RequestMapping("/login")
    public VendorLoginResponse VendorLogin(@RequestBody String body, HttpSession session) {
        VendorLoginRequest request = new Gson().fromJson(body, VendorLoginRequest.class);
        return vendorAdminService.loginVendor(request, session);
    }

    @RequestMapping("/find/id")
    public VendorFindIdResponse VendorFindId(@RequestBody String body) {
        VendorFindIdRequest request = new Gson().fromJson(body, VendorFindIdRequest.class);
        return vendorAdminService.vendorFindIdPost(request);
    }

    @RequestMapping("/find/password/email/validate")
    public VendorPasswordFindResponse VendorFindPassword(HttpServletResponse servletResponse, @RequestBody String body) {
        VendorFindPasswordRequest request = new Gson().fromJson(body, VendorFindPasswordRequest.class);
        return vendorAdminService.findPassword(servletResponse, request);
    }

    @RequestMapping("/validate/cookie")
    public int ValidateCodeFromCookie(HttpServletRequest servletRequest, @RequestBody String body) {
        VendorValidationCodeRequest request = new Gson().fromJson(body, VendorValidationCodeRequest.class);
        for (Cookie cookie : servletRequest.getCookies()) {
            log.info("name : " + cookie.getName());
            log.info("value : " + cookie.getValue());
            if (cookie.getName().equals("validation_code")) {
                if (request.getValidation_code().equals(cookie.getValue())) {
                    return 0;
                } else {
                    return 1;
                }
            }
        }
        return 2;
    }

    @RequestMapping("/find/password/reset")
    public int VendorResetPassword(@RequestBody String body) {
        VendorPasswordResetRequest request = new Gson().fromJson(body, VendorPasswordResetRequest.class);
        return vendorAdminService.resetPassword(request, null);
    }

    @RequestMapping("/register/email/validate")
    public VendorRegisterEmailResponse VendorValidateEmail(@RequestBody String body) {
        VendorRegisterEmailRequest request = new Gson().fromJson(body, VendorRegisterEmailRequest.class);
        return vendorAdminService.validateEmail(request);
    }

    @RequestMapping("/register/business/validate")
    public int VendorValidateBusinessNumber(@RequestBody String body) throws IOException {
        VendorBusinessValidateRequest request = new Gson().fromJson(body, VendorBusinessValidateRequest.class);
        return vendorAdminService.validateBusinessNumber(request);
    }

    @RequestMapping("/register/done/skip")
    public int VendorRegisterDoneSkipped(@RequestBody String body) {
        VendorRegisterRequest request = new Gson().fromJson(body, VendorRegisterRequest.class);
        return vendorAdminService.registerVendorSkipped(request);
    }

    @RequestMapping("/register/done/all")
    public int VendorRegisterDoneAll(HttpServletRequest request,
                                     @RequestParam("vendor_data") String vendor_data,
                                     @RequestParam("store_data") String store_data) throws IOException, URISyntaxException {
        // File Control
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        Iterator<String> keys = fileMap.keySet().iterator();
        ArrayList<String> imageList = new ArrayList<>();
        String time = Time.TimeForFile();
        String timeForDB = Time.TimeFormatHMS();
        while (keys.hasNext()) {
            String key = keys.next();
            if (key.contains("img")) {
                if (!fileMap.get(key).isEmpty()) {
                    String path = fileUploadUtility.uploadFile("api/images/store/init/" + time + "/", fileMap.get(key).getOriginalFilename(), fileMap.get(key).getBytes(), Constant.AWS_SAVE);
                    imageList.add("api/images/store/init/" + time + "/" + path);
                }
            }
        }
        VendorRegisterRequest vendorRegisterRequest = new Gson().fromJson(vendor_data, VendorRegisterRequest.class);
        vendorRegisterRequest.setReg_date(timeForDB);
        StoreRegisterRequest storeRegisterRequest = new Gson().fromJson(store_data, StoreRegisterRequest.class);
        if (imageList.size() > 0) {
            storeRegisterRequest.setThumbnail(imageList.get(0));
            storeRegisterRequest.setImage_list(new Gson().toJson(imageList));
            storeRegisterRequest.setReg_date(timeForDB);
        }
        return vendorAdminService.registerVendorAll(vendorRegisterRequest, storeRegisterRequest);
    }

    @RequestMapping("/mypage/logout")
    public boolean VendorLogOut(HttpSession session) {
        session.removeAttribute("vendor_no");
        return true;
    }

    @RequestMapping("/mypage/password/validate")
    public boolean VendorValidatePassword(HttpSession session,
                                          @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorPasswordValidationRequest request = new Gson().fromJson(body, VendorPasswordValidationRequest.class);
        return vendorAdminService.validateVendorPassword(vendor_no, request.getPassword());
    }

    @RequestMapping("/mypage/password/change")
    public int VendorPasswordChange(HttpSession session,
                                    @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorPasswordResetRequest request = new Gson().fromJson(body, VendorPasswordResetRequest.class);
        request.setVendor_no(vendor_no);
        return vendorAdminService.resetPassword(request, session);
    }

    @RequestMapping("/mypage/change/personal")
    public boolean VendorChangePersonalData(HttpSession session,
                                            @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorAdminEditPersonalDataRequest request = new Gson().fromJson(body, VendorAdminEditPersonalDataRequest.class);
        request.setVendor_no(vendor_no);
        return vendorAdminService.changeVendorPersonalData(request);
    }

    @RequestMapping("/mypage/change/bank")
    public boolean VendorChangeBankData(HttpSession session,
                                        @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorAdminEditBankDataRequest request = new Gson().fromJson(body, VendorAdminEditBankDataRequest.class);
        request.setVendor_no(vendor_no);
        return vendorAdminService.changeVendorBankData(request);
    }

    @RequestMapping("/mypage/change/business")
    public boolean VendorChangeBusinessData(HttpSession session,
                                            @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorAdminEditBusinessDataRequest request = new Gson().fromJson(body, VendorAdminEditBusinessDataRequest.class);
        request.setVendor_no(vendor_no);
        return vendorAdminService.changeVendorBusinessData(request);
    }

    @RequestMapping("/manage/store/review/paging")
    public VendorStoreManagementReviewPagingResponse VendorReviewListCallDataByPagination(HttpSession session,
                                                                                          @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorPagingRequest request = new Gson().fromJson(body, VendorPagingRequest.class);
        request.setVendor_no(vendor_no);
        request.setStart_index((request.getPage() - 1) * 10);
        return vendorAdminService.getReviewListCallDataByPagination(request);
    }

    @RequestMapping("/manage/store/review/detail")
    public VendorStoreManagementReviewDetail VendorReviewDetailForModal(HttpSession session,
                                                                        @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorAdminReviewDetailRequest request = new Gson().fromJson(body, VendorAdminReviewDetailRequest.class);
        return vendorAdminService.getReviewDetailForModal(request);
    }

    @RequestMapping("/manage/store/review/answer")
    public boolean VendorReviewAnswer(HttpSession session,
                                      @RequestBody String body) {
        VendorAdminReviewAnswerRequest request = new Gson().fromJson(body, VendorAdminReviewAnswerRequest.class);
        return vendorAdminService.answerReview(request);
    }

    @RequestMapping("/manage/goods/delete")
    public boolean VendorDeleteGoods(HttpSession session,
                                     @RequestBody String body) {
        VendorAdminDeleteGoodsRequest request = new Gson().fromJson(body, VendorAdminDeleteGoodsRequest.class);
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        request.setVendor_no(vendor_no);
        return vendorAdminService.deleteGoods(request);
    }

    @RequestMapping("/manage/goods/register")
    public int VendorRegisterGoods(HttpSession session,
                                   HttpServletRequest servletRequest,
                                   @RequestParam("goods_data") String body) throws IOException {

        VendorAdminRegisterGoodsRequest request = new Gson().fromJson(body, VendorAdminRegisterGoodsRequest.class);
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        request.setVendor_no(vendor_no);
        // File Control
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) servletRequest;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        Iterator<String> keys = fileMap.keySet().iterator();
        ArrayList<String> imageList = new ArrayList<>();
        String timeForDB = Time.TimeFormatHMS();
        while(keys.hasNext()){
            String key = keys.next();
            if(key.contains("img")){
                if(!fileMap.get(key).isEmpty()){
                    String path = fileUploadUtility.uploadFile("api/images/store/" + request.getStore_no() + "/", fileMap.get(key).getOriginalFilename(), fileMap.get(key).getBytes(), Constant.AWS_SAVE);
                    imageList.add("api/images/store/" + request.getStore_no() + "/" + path);
                }
            }
        }
        request.setGoods_img(imageList.get(0));
        request.setReg_date(timeForDB);
        return vendorAdminService.registerGoods(request);
    }

    @RequestMapping("/manage/goods/edit")
    public int VendorEditGoods(HttpSession session,
                               HttpServletRequest servletRequest,
                               @RequestParam("goods_data") String body) throws IOException {
        VendorAdminEditGoodsRequest request = new Gson().fromJson(body, VendorAdminEditGoodsRequest.class);
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        request.setVendor_no(vendor_no);
        // File Control
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) servletRequest;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        Iterator<String> keys = fileMap.keySet().iterator();
        ArrayList<String> imageList = new ArrayList<>();
        while(keys.hasNext()){
            String key = keys.next();
            if(key.contains("img")){
                if(!fileMap.get(key).isEmpty()){
                    String path = fileUploadUtility.uploadFile("api/images/store/" + request.getStore_no() + "/", fileMap.get(key).getOriginalFilename(), fileMap.get(key).getBytes(), Constant.AWS_SAVE);
                    imageList.add("api/images/store/" + request.getStore_no() + "/" + path);
                }
            }
        }
        if(imageList.size() > 0){
            request.setGoods_img(imageList.get(0));
        }
        return vendorAdminService.editGoods(request);
    }

    @RequestMapping("/manage/goods/list/paging")
    public VendorStoreManagementGoodsPagingResponse VendorGoodsCallByPagination(HttpSession session,
                                                                                @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorPagingRequest request = new Gson().fromJson(body, VendorPagingRequest.class);
        request.setVendor_no(vendor_no);
        request.setStart_index((request.getPage() - 1) * 10);
        return vendorAdminService.getGoodsListDataCallByPagination(request);
    }

    @RequestMapping("/manage/point/charge/paging")
    public VendorStoreManagementPointChargePagingResponse VendorPointChargeCallByPagination(HttpSession session,
                                                                                            @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorPagingRequest request = new Gson().fromJson(body, VendorPagingRequest.class);
        request.setVendor_no(vendor_no);
        request.setStart_index((request.getPage() - 1) * 10);
        return vendorAdminService.getPointChargeListDataCallByPagination(request);
    }

    @RequestMapping("/manage/point/accumulate/paging")
    public VendorStoreManagementPointAccumulatePagingResponse VendorPointAccumulateCallByPagination(HttpSession session,
                                                                                                    @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorPagingRequest request = new Gson().fromJson(body, VendorPagingRequest.class);
        request.setVendor_no(vendor_no);
        request.setStart_index((request.getPage() - 1) * 10);
        return vendorAdminService.getPointAccumulateListDataCallByPagination(request);
    }

    @RequestMapping("/manage/sales/paging")
    public VendorStoreManagementSalesPagingResponse VendorSalesListCallByPagination(HttpSession session,
                                                                                    @RequestBody String body) {
        Integer vendor_no = (Integer) session.getAttribute("vendor_no");
        VendorPagingRequest request = new Gson().fromJson(body, VendorPagingRequest.class);
        request.setVendor_no(vendor_no);
        request.setStart_index((request.getPage() - 1) * 10);
        return vendorAdminService.getVendorSalesListDataCallByPagination(request);
    }

    @RequestMapping("/manage/customer/notice/paging")
    public VendorStoreManagementNoticePagingResponse VendorNoticeListCallByPagination(HttpSession session,
                                                                                      @RequestBody String body) {
        VendorPagingRequest request = new Gson().fromJson(body, VendorPagingRequest.class);
        request.setStart_index((request.getPage() - 1) * 10);
        return vendorAdminService.getNoticeListDataCallByPagination(request);
    }

    @RequestMapping("/manage/customer/faq/paging")
    public VendorStoreManagementFAQPagingResponse VendorFAQListCallByPagination(HttpSession session,
                                                                                @RequestBody String body) {
        VendorPagingRequest request = new Gson().fromJson(body, VendorPagingRequest.class);
        request.setStart_index((request.getPage() - 1) * 10);
        return vendorAdminService.getFAQListDataCallByPagination(request);
    }

    @RequestMapping("/manage/point/charge/reject")
    public VendorStoreManagementPointChargeRejectInfo VendorPointChargeRejectModalInfo(HttpSession session,
                                                                                       @RequestBody String body) {
        VendorPointChargeRejectModalRequest request = new Gson().fromJson(body, VendorPointChargeRejectModalRequest.class);
        return vendorAdminService.getVendorPointChargeRejectInfo(request);
    }

    @RequestMapping("/manage/point/charge/cancel/info")
    public VendorStoreManagementPointChargeCancelInfo VendorPointChargeCancelModalInfo(HttpSession session,
                                                                                       @RequestBody String body) {
        VendorPointChargeCancelModalRequest request = new Gson().fromJson(body, VendorPointChargeCancelModalRequest.class);
        return vendorAdminService.getVendorPointChargeModalInfo(request);
    }

    @RequestMapping("/manage/point/charge/cancel/request")
    public int VendorPointChargeCancel(HttpSession session, @RequestBody String body) {
        VendorPointChargeCancelRequest request = new Gson().fromJson(body, VendorPointChargeCancelRequest.class);
        return vendorAdminService.cancelVendorPointCharge(request);
    }

    @RequestMapping("/manage/point/accumulate/review")
    public VendorStoreManagementPointAccumulateReviewInfo VendorPointAccumulateModalInfo(HttpSession session,
                                                                                          @RequestBody String body) {
        VendorPointAccumulateReviewRequest request = new Gson().fromJson(body, VendorPointAccumulateReviewRequest.class);
        return vendorAdminService.getVendorPointAccumulateReviewInfo(request);

    }

    @RequestMapping("/manage/point/accumulate/reject")
    public VendorStoreManagementPointAccumulateCancelRejectInfo VendorPointAccumulateCancelRejectModalInfo(HttpSession session,
                                                                                                           @RequestBody String body) {
        VendorPointAccumulateCancelRejectRequest request = new Gson().fromJson(body, VendorPointAccumulateCancelRejectRequest.class);
        return vendorAdminService.getVendorPointAccumulateCancelRejectInfo(request);
    }

    @RequestMapping("/manage/point/accumulate/cancel/info")
    public VendorStoreManagementPointAccumulateCancelInfo VendorPointAccumulateCancelModalInfo(HttpSession session,
                                                                                               @RequestBody String body) {
        VendorPointAccumulateCancelModalRequest request = new Gson().fromJson(body, VendorPointAccumulateCancelModalRequest.class);
        return vendorAdminService.getVendorPointAccumulateCancelModalInfo(request);
    }

}
