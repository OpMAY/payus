package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

import java.util.List;

@Data
public class Review {
    private int review_no;
    private int store_no;
    private int user_no;
    private int accumulate_no;
    private String store_name;
    private String user_name;
    private String content;
    private int rate;
    private String reg_date;
    private List<String> image_list;
    private boolean answer_status;
    private String answer_content;
    private String answer_date;
}
