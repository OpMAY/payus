package com.mvsolutions.payus.model.rest.response.usermypage;

import lombok.Data;

import java.util.List;

@Data
public class UserMyReviewResponse {
    private int review_no;
    private String store_name;
    private String reg_date;
    private int rate;
    private List<String> image_list;
    private boolean answer_status;
    private String answer_content;
    private String answer_date;
}
