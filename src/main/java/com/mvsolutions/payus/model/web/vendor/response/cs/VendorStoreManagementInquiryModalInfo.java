package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementInquiryModalInfo {
    private String title;
    private int type;
    private String reg_date;
    private boolean answer_status;
    private String content;
    private List<String> image_list;
    private String answer_content;
}
