package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class Notice {
    private int notice_no;
    private String title;
    private String content;
    private String img;
    private String reg_date;
}
