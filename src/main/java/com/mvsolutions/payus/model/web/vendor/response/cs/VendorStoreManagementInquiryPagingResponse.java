package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementInquiryPagingResponse {
    private int inquiryNum;
    private List<VendorInquiryList> inquiryList;
}
