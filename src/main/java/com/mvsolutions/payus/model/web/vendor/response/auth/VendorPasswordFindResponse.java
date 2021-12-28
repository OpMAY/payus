package com.mvsolutions.payus.model.web.vendor.response.auth;

import lombok.Data;

@Data
public class VendorPasswordFindResponse {
    private boolean id_exist;
    private int vendor_no;
    private String validation_code;
}
