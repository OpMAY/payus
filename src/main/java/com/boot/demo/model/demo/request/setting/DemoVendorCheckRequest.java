package com.boot.demo.model.demo.request.setting;

import lombok.Data;

@Data
public class DemoVendorCheckRequest {
    private VendorCheckComponents vendor;

    @Data
   public static class VendorCheckComponents{
        private int vendor_no;
        private String password;
    }
}

