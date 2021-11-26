package com.mvsolutions.payus.model.web.vendor.request.auth;

import lombok.Data;

@Data
public class VendorRegisterRequest {
    private int vendor_no;
    private String id;
    private String password;
    private String vendor_name;
    private String reg_date;
    private String business_code;
    private String phone;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
}
