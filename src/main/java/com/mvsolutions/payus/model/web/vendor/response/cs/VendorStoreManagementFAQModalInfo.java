package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

@Data
public class VendorStoreManagementFAQModalInfo {
    private String question;
    private String answer;
    private String img;
    private int type;
    private String reg_date;
}
