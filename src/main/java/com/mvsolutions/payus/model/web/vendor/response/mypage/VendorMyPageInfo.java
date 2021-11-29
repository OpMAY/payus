package com.mvsolutions.payus.model.web.vendor.response.mypage;

import lombok.Data;

@Data
public class VendorMyPageInfo {
    private String id;
    private String name;
    private String phone;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
}
