package com.mvsolutions.payus.mapper;


import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorHomeResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.SupPointChargeDataResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindIdRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorFindPasswordRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorPasswordResetRequest;
import com.mvsolutions.payus.model.web.vendor.request.auth.VendorRegisterRequest;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorFindIdResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResponse;
import com.mvsolutions.payus.model.web.vendor.response.auth.VendorPasswordFindResultData;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageBusinessInfo;
import com.mvsolutions.payus.model.web.vendor.response.mypage.VendorMyPageInfo;
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

    List<VendorStoreManagementReviewInfo> getVendorReviewListForStoreManagement(int vendor_no);
}
