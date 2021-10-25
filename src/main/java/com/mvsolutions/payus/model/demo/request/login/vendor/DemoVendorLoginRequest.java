package com.mvsolutions.payus.model.demo.request.login.vendor;

import lombok.Data;

@Data
public class DemoVendorLoginRequest {
    private VendorLoginComponents vendor;

    @Data
    public static class VendorLoginComponents{
        private String id;
        private String password;
    }
}

