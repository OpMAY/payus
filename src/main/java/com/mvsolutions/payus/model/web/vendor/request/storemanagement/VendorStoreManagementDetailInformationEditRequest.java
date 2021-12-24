package com.mvsolutions.payus.model.web.vendor.request.storemanagement;

import lombok.Data;

@Data
public class VendorStoreManagementDetailInformationEditRequest {
    private int information_no;
    private String title;
    private String content;
}
