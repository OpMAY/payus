package com.mvsolutions.payus.model.rest.request.loginpage.vendor;

import lombok.Data;

@Data
public class VendorLoginRequest {
    private String id;
    private String password;
    private String fcm_token;
}
