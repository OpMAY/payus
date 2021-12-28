package com.mvsolutions.payus.model.web.vendor.request.point;

import lombok.Data;

@Data
public class VendorPointAccumulateReviewAnswerRequest {
    private int accumulate_no;
    private String answer;
    private String reg_date;
}
