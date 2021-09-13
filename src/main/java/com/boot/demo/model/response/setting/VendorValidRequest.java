package com.boot.demo.model.response.setting;

import lombok.Data;

@Data
public class VendorValidRequest {
    private VendorValidCheckComponents vendor;

    @Data
    public static class VendorValidCheckComponents{
        private int vendor_no;
        private String password;
    }
}
