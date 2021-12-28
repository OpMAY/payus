package com.mvsolutions.payus.model.web.basic;

import lombok.Data;

import java.util.List;

@Data
public class InquiryVendor {
    private int inquiry_no;
    private int vendor_no;
    private int type;
    private String title;
    private String content;
    private List<String> image_list;
    private InquiryVendorJson inquiry_json;
    private String reg_date;
    private boolean answer_status;
    private String answer_content;
    private String answer_date;
}
