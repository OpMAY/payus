package com.mvsolutions.payus.model.web.vendor.response.storemanagement;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementReviewDetail {
    private int review_no;
    private String user_name;
    private int rate;
    private String reg_date;
    private boolean answer_status;
    private String content;
    private List<String> image_list;
    private String answer_content;
    private String answer_date;
}
