package com.mvsolutions.payus.mapper;


import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorLoginResponse;

public interface VendorMapper {
    boolean checkVendorExists(VendorLoginRequest request);

    VendorLoginResponse loginVendor(VendorLoginRequest request);

    boolean checkVendorPenalty(int vendor_no);

    String getVendorName(int vendor_no);
}
