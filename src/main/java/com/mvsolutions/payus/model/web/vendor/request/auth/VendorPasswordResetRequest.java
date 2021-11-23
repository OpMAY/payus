package com.mvsolutions.payus.model.web.vendor.request.auth;

import lombok.Data;

@Data
public class VendorPasswordResetRequest {
    private int vendor_no;
    private String password;
}
