package com.mvsolutions.payus.model.rest.response.suphomepage;

import lombok.Data;

@Data
public class VendorReviewContentResponse {
    private int review_no;
    private String user_name;
    private String content;
    private int rate;
    private String reg_date;
}
