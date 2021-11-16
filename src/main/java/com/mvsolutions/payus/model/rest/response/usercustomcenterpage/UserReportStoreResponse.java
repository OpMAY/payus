package com.mvsolutions.payus.model.rest.response.usercustomcenterpage;

import lombok.Data;

import java.util.List;

@Data
public class UserReportStoreResponse {
    private int report_no;
    private int user_no;
    private int store_no;
    private String store_name;
    private String title;
    private String content;
    private List<String> img_list;
    private String reg_date;
    private boolean answer_status;
    private String answer_content;
    private String answer_date;
    private boolean read_check;
}
