package com.mvsolutions.payus.model.web.vendor.request.mypage;

import lombok.Data;

@Data
public class VendorAdminEditBusinessDataRequest {
    private int vendor_no;
    private String storeName;
    private String vendorName;
}
