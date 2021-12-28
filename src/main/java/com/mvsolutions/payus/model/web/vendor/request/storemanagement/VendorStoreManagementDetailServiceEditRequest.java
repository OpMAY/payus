package com.mvsolutions.payus.model.web.vendor.request.storemanagement;

import lombok.Data;

@Data
public class VendorStoreManagementDetailServiceEditRequest {
    private int service_no;
    private String title;
    private String content;
}
