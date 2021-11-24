package com.mvsolutions.payus.model.web.vendor.response.auth;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class VendorRegisterEmailResponse {
    private String validation_code;
}
