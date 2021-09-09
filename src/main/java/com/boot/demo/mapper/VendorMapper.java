package com.boot.demo.mapper;

import com.boot.demo.model.response.home.HomeVendor;
import com.boot.demo.model.response.login.vendor.VendorLoginResponse;

public interface VendorMapper {
    HomeVendor getUserInfoByUserNoForHome(int vendor_no);

    VendorLoginResponse loginVendor(String id, String password);
}
