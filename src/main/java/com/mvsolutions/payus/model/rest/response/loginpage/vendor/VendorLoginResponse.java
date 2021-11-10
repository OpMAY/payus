package com.mvsolutions.payus.model.rest.response.loginpage.vendor;

import lombok.Data;

@Data
public class VendorLoginResponse {
    private int vendor_no;
    private boolean valid_vendor;
    private boolean vendor_penalty;
}
