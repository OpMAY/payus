package com.boot.demo.model.demo.response.detail;

import lombok.Data;

import java.util.List;

@Data
public class StoreReviewComponents {
    private int review_no;
    private String user_name;
    private String content;
    private List<String> image_list;
    private String answer_content;
    private String reg_date;
    private String answer_date;
    private float review_ratio;
    private boolean is_answered;
}
