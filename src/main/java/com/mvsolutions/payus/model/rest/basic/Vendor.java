package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class Vendor {
    private int vendor_no;
    private String id;
    private String password;
    private String reg_date;
    private int point;
    private boolean valid_vendor;
    private String business_code;
}
