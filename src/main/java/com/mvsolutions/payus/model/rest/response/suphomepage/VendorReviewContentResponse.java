package com.mvsolutions.payus.model.rest.response.suphomepage;

import lombok.Data;

import java.util.List;

@Data
public class VendorReviewContentResponse {
    private int review_no;
    private String user_name;
    private String content;
    private int rate;
    private List<String> image_list;
    private String reg_date;
}
