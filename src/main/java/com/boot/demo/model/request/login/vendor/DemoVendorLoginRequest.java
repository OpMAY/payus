package com.boot.demo.model.request.login.vendor;

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

