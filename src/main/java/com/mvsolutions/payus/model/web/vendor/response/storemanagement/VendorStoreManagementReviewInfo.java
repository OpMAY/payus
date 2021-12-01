package com.mvsolutions.payus.model.web.vendor.response.storemanagement;

import lombok.Data;

@Data
public class VendorStoreManagementReviewInfo {
    private int review_no;
    private String content;
    private int rate;
    private String user_name;
    private String reg_date;
    private boolean answer_status;
}
