package com.boot.demo.model;

import lombok.Data;

@Data
public class Review {
    private int review_no;
    private int store_no;
    private int user_no;
    private String reg_date;
    private float review_ratio;
    private String image_list;
    private String content;
    private boolean is_answered;
    private String answer_content;
    private String answer_date;
    private String user_name;
}
