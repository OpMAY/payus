package com.mvsolutions.payus.model.web.vendor.request.storemanagement;

import lombok.Data;

@Data
public class VendorStoreManagementDetailServiceRegisterRequest {
    private int service_no;
    private int vendor_no;
    private String title;
    private String content;
    private String reg_date;
}
