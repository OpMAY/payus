package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

@Data
public class VendorInquiryRequest {
    private int vendor_no;
    private int type;
    private String title;
    private String content;
    private String reg_date;
    private String image_list;
    private String inquiry_json;
}
