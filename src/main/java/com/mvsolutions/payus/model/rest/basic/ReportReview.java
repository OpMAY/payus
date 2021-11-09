package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

import java.util.List;

@Data
public class ReportReview {
    private int report_no;
    private int vendor_no;
    private int review_no;
    private String title;
    private String content;
    private List<String> img_list;
    private String reg_date;
    private boolean answer_status;
    private String answer_content;
    private String answer_date;
}
