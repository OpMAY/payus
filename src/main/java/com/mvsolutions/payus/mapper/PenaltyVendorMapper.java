package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.loginpage.vendor.VendorPenaltyResponse;

import java.util.List;

public interface PenaltyVendorMapper {
    List<VendorPenaltyResponse> getVendorPenaltyInfo(int vendor_no);
}
