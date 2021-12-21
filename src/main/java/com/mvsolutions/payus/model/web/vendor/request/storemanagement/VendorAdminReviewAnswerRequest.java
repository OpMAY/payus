package com.mvsolutions.payus.model.web.vendor.request.storemanagement;

import lombok.Data;

@Data
public class VendorAdminReviewAnswerRequest {
    private int review_no;
    private String answer_content;
    private String answer_date;
}
