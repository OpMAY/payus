package com.mvsolutions.payus.model.rest.response.storedetailpage;

import lombok.Data;

import java.util.List;

@Data
public class StoreReviewPageResponse {
    private int review_no;
    private String store_name;
    private String user_name;
    private String reg_date;
    private String content;
    private int rate;
    private List<String> image_list;
    private boolean answer_status;
    private String answer_content;
    private String answer_date;
}
