package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

@Data
public class VendorInquiryList {
    private int inquiry_no;
    private int type;
    private String title;
    private String reg_date;
    private boolean answer_status;
}
