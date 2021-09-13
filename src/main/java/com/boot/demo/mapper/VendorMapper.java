package com.boot.demo.mapper;

import com.boot.demo.model.response.home.HomeVendor;
import com.boot.demo.model.response.login.vendor.VendorLoginResponse;
import com.boot.demo.model.response.setting.BankInfoEditRequest;
import com.boot.demo.model.response.setting.VendorShortInfoResponse;
import com.boot.demo.model.response.setting.VendorSpecificInfoResponse;

public interface VendorMapper {
    HomeVendor getVendorInfoByVendorNoForHome(int vendor_no);

    VendorLoginResponse loginVendor(String id, String password);

    VendorShortInfoResponse getVendorShortData(int vendor_no);

    boolean checkValidVendor(int vendor_no, String password);

    VendorSpecificInfoResponse getVendorProfile(int vendor_no);

    void updateVendorPersonal(int vendor_no, String phone);

    void updateVendorBank(int vendor_no, BankInfoEditRequest.BankInfoEditComponents bank);
}
