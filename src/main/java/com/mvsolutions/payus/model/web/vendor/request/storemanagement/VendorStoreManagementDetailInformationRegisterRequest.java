package com.mvsolutions.payus.model.web.vendor.request.storemanagement;

import lombok.Data;

@Data
public class VendorStoreManagementDetailInformationRegisterRequest {
    private int information_no;
    private int vendor_no;
    private String title;
    private String content;
    private String reg_date;
}
