package com.boot.demo.model.response.setting;

import lombok.Data;

@Data
public class VendorSpecificInfoResponse {
    private int vendor_no;
    private String id;
    private String name;
    private String email;
    private String phone;
    private String profile_img;
    private String bank_name;
    private String bank_owner;
    private String bank_account;
}
