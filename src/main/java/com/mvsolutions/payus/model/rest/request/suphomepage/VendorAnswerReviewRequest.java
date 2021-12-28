package com.mvsolutions.payus.model.rest.request.suphomepage;

import lombok.Data;

@Data
public class VendorAnswerReviewRequest {
    private int review_no;
    private String answer_content;
    private String answer_date;
}
