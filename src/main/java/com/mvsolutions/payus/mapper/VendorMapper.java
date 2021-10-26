package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.demo.response.home.HomeVendor;
import com.mvsolutions.payus.model.demo.response.login.vendor.VendorLoginResponse;
import com.mvsolutions.payus.model.demo.response.setting.BankInfoEditRequest;
import com.mvsolutions.payus.model.demo.response.setting.VendorShortInfoResponse;
import com.mvsolutions.payus.model.demo.response.setting.VendorSpecificInfoResponse;

public interface VendorMapper {
    HomeVendor getVendorInfoByVendorNoForHome(int vendor_no);

    VendorLoginResponse loginVendor(String id, String password);

    VendorShortInfoResponse getVendorShortData(int vendor_no);

    boolean checkValidVendor(int vendor_no, String password);

    VendorSpecificInfoResponse getVendorProfile(int vendor_no);

    void updateVendorPersonal(int vendor_no, String phone);

    void updateVendorBank(int vendor_no, BankInfoEditRequest.BankInfoEditComponents bank);
}
