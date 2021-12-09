package com.mvsolutions.payus.model.web.vendor.request.mypage;

import lombok.Data;

@Data
public class VendorAdminEditPersonalDataRequest {
    private int vendor_no;
    private String name;
    private String phone;
}
