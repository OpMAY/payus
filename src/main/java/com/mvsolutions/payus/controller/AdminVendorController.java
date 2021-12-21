package com.mvsolutions.payus.controller;

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
import com.mvsolutions.payus.response.payus.vendor.GoodsType;
import com.mvsolutions.payus.service.VendorAdminService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@Log4j2
@RequestMapping(value = "/vendor", method = RequestMethod.GET)
public class AdminVendorController {
    @Autowired
    private VendorAdminService vendorAdminService;

    private ModelAndView VIEW;

    @RequestMapping("/login.do")
    public ModelAndView VendorLoginPage() {
        VIEW = new ModelAndView("login_vendor");
        return VIEW;
    }

    @RequestMapping("/register.do")
    public ModelAndView VendorRegisterPage() {
        VIEW = new ModelAndView("register_vendor");
        return VIEW;
    }

    @RequestMapping("/register/bank.do")
    public ModelAndView VendorBankPage() {
        VIEW = new ModelAndView("register_vendor_2");
        return VIEW;
    }

    @RequestMapping("/register/business.do")
    public ModelAndView VendorBusinessPage() {
        VIEW = new ModelAndView("register_vendor_3");
        return VIEW;
    }

    @RequestMapping("/register/store.do")
    public ModelAndView VendorStorePage() {
        VIEW = new ModelAndView("register_vendor_4");
        return VIEW;
    }

    @RequestMapping("/find/identification.do")
    public ModelAndView VendorFindIdPage() {
        VIEW = new ModelAndView("vendor_find_id");
        return VIEW;
    }

    @RequestMapping("/find/identification/result.do")
    public ModelAndView VendorFindIdResultPage(HttpServletRequest request, HttpServletResponse response) {
        VIEW = new ModelAndView("vendor_result_id");
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("vendor_find_no")) {
                String id = vendorAdminService.findIdVendor(Integer.parseInt(cookie.getValue()));
                VIEW.addObject("id", id);
                Cookie setCookie = new Cookie("vendor_find_no", null);
                setCookie.setMaxAge(0);
                response.addCookie(setCookie);
                break;
            }
        }
        return VIEW;
    }

    @RequestMapping("/find/password.do")
    public ModelAndView VendorFindPasswordPage() {
        VIEW = new ModelAndView("vendor_find_password");
        return VIEW;
    }

    @RequestMapping("/find/password/result.do")
    public ModelAndView VendorFindPasswordResultPage(HttpServletRequest request, HttpServletResponse response) {
        VIEW = new ModelAndView("vendor_set_password");
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("find_password_no")) {
                VendorPasswordFindResultData data = vendorAdminService.getPasswordFindResult(Integer.parseInt(cookie.getValue()));
                VIEW.addObject("id", data.getId());
                VIEW.addObject("vendor_no", data.getVendor_no());
                Cookie setCookie = new Cookie("find_password_no", null);
                setCookie.setMaxAge(0);
                setCookie.setPath(cookie.getPath());
                response.addCookie(setCookie);
            } else if (cookie.getName().equals("validation_code")) {
                Cookie setCookie = new Cookie("validation_code", null);
                setCookie.setMaxAge(0);
                setCookie.setPath(cookie.getPath());
                response.addCookie(setCookie);
            }
        }
        return VIEW;
    }

    @RequestMapping("/login/fail/validation.do")
    public ModelAndView VendorNotValidatedPage() {
        VIEW = new ModelAndView("vendor_not_valid");
        return VIEW;
    }

    @RequestMapping("/login/fail/rejected.do")
    public ModelAndView VendorRejectedPage() {
        VIEW = new ModelAndView("vendor_rejected");
        VIEW.addObject("reject", "반려 사유");
        return VIEW;
    }

    @RequestMapping("/terms/personal.do")
    public ModelAndView PersonalTermsPage() {
        VIEW = new ModelAndView("personal_term");
        return VIEW;
    }

    @RequestMapping("/terms/service.do")
    public ModelAndView ServiceTermsPage() {
        VIEW = new ModelAndView("service_term");
        return VIEW;
    }

    @RequestMapping("/mypage/vendor.do")
    public ModelAndView MyPageVendorPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_mypage_1");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        VendorMyPageInfo info = vendorAdminService.getVendorInfoForMyPage(vendor_no);
        VIEW.addObject("vendor", info);
        return VIEW;
    }

    @RequestMapping("/mypage/business.do")
    public ModelAndView MyPageBusinessPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_mypage_2");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        VendorMyPageBusinessInfo info = vendorAdminService.getVendorBusinessInfoForMyPage(vendor_no);
        VIEW.addObject("vendor", info);
        return VIEW;
    }

    @RequestMapping("/manage/store/info.do")
    public ModelAndView StoreManagementInformationPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_store_management_1");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        VendorStoreManagementStoreInfo info = vendorAdminService.getVendorStoreInfoForStoreManagement(vendor_no);
        VIEW.addObject("store", info);
        return VIEW;
    }

    @RequestMapping("/manage/store/detail.do")
    public ModelAndView StoreManagementDetailPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_store_management_2");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        VendorStoreManagementStoreDetailInfo info = vendorAdminService.getVendorStoreDetailForStoreManagement(vendor_no);
        VIEW.addObject("store", info);
        return VIEW;
    }

    @RequestMapping("/manage/store/review.do")
    public ModelAndView StoreManagementReviewListPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_store_management_3");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        List<VendorStoreManagementReviewInfo> reviewList = vendorAdminService.getVendorReviewListForStoreManagementInit(vendor_no);
        VIEW.addObject("review", reviewList);
        VIEW.addObject("review_num", vendorAdminService.getVendorReviewNumber(vendor_no));
        return VIEW;
    }

    @RequestMapping("/manage/goods/list.do")
    public ModelAndView GoodsManagementListPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_goods_management_1");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        StoreGoods goods = vendorAdminService.getVendorStoreGoodsList(vendor_no, GoodsType.ROOMS);
        VIEW.addObject("rooms", goods.getRoom_options());
        VIEW.addObject("goodsType", GoodsType.ROOMS);
        return VIEW;
    }

    @RequestMapping("/manage/goods/register.do")
    public ModelAndView GoodsManagementRegisterPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_goods_management_2");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        int store_no = vendorAdminService.getVendorStoreNo(vendor_no);
        int paybackRate = vendorAdminService.getPaybackRateForRegisterGoods(vendor_no);
        VIEW.addObject("paybackRate", paybackRate);
        VIEW.addObject("store_no", store_no);
        return VIEW;
    }

    @RequestMapping("/manage/goods/edit.do")
    public ModelAndView GoodsManagementEditPage(HttpServletRequest request,
                                                @RequestParam("goods_no") int goods_no) {
        VIEW = new ModelAndView("vendor_goods_management_3");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        int goodsIndex = 0;
        StoreGoods goods = vendorAdminService.getVendorStoreGoodsList(vendor_no, GoodsType.ROOMS);
        log.info(goods.getRoom_options());
        for (int i = 0; i < goods.getRoom_options().size(); i++) {
            if (goods.getRoom_options().get(i).getRoom_no() == goods_no) {
                goodsIndex = i;
                break;
            }
        }
        int paybackRate = vendorAdminService.getPaybackRateForRegisterGoods(vendor_no);
        int storeNo = vendorAdminService.getVendorStoreNo(vendor_no);
        VIEW.addObject("paybackRate", paybackRate);
        VIEW.addObject("room", goods.getRoom_options().get(goodsIndex));
        VIEW.addObject("store_no", storeNo);
        return VIEW;
    }

    @RequestMapping("/manage/point/charge.do")
    public ModelAndView PointManagementChargePage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_point_charge_list");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        List<VendorAdminPointChargeList> chargeList = vendorAdminService.getVendorAdminPointChargeList(vendor_no);
        int point = vendorAdminService.getVendorPointValue(vendor_no);
        int chargeListNum = vendorAdminService.getVendorPointChargeListNumber(vendor_no);
        VIEW.addObject("charge", chargeList);
        VIEW.addObject("point", point);
        VIEW.addObject("chargeNum", chargeListNum);
        return VIEW;
    }

    @RequestMapping("/manage/point/accumulate.do")
    public ModelAndView PointManagementAccumulatePage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_point_accumulate_list");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        List<VendorAdminPointAccumulateList> accumulateList = vendorAdminService.getVendorAdminPointAccumulateList(vendor_no);
        int accumulateNum = vendorAdminService.getVendorPointAccumulateListNumber(vendor_no);
        int point = vendorAdminService.getVendorPointValue(vendor_no);
        VIEW.addObject("accumulate", accumulateList);
        VIEW.addObject("point", point);
        VIEW.addObject("accumulateNum", accumulateNum);
        return VIEW;
    }

    @RequestMapping("/manage/sales.do")
    public ModelAndView VendorSalesPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_sales");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        // TODO 매출 정보 from point_accumulate
        return VIEW;
    }

    @RequestMapping("/manage/customer/notice.do")
    public ModelAndView VendorNoticePage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_notice");
        List<VendorAdminNoticeList> noticeList = vendorAdminService.getNoticeList();
        VIEW.addObject("notice", noticeList);
        return VIEW;
    }

    @RequestMapping("/manage/customer/faq.do")
    public ModelAndView VendorFAQPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_faq");
        List<VendorAdminFAQList> faqList = vendorAdminService.getFAQList();
        VIEW.addObject("faq", faqList);
        return VIEW;
    }

    @RequestMapping("/manage/customer/inquiry/list.do")
    public ModelAndView VendorInquiryListPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_inquiry_1");
        Integer vendor_no = (Integer) request.getSession().getAttribute("vendor_no");
        //TODO Inquiry List
        return VIEW;
    }

    @RequestMapping("/manage/customer/inquiry/request.do")
    public ModelAndView VendorInquiryRequestPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_inquiry_2");
        return VIEW;
    }

    @RequestMapping("/mypage/password/validation.do")
    public ModelAndView VendorPasswordValidationPage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_validate_password");
        return VIEW;
    }

    @RequestMapping("/mypage/password/change.do")
    public ModelAndView VendorPasswordChangePage(HttpServletRequest request) {
        VIEW = new ModelAndView("vendor_change_password");
        return VIEW;
    }


}