package com.mvsolutions.payus.model.rest.response.usercustomcenterpage;

import lombok.Data;

@Data
public class NoticeResponse {
    private int notice_no;
    private String title;
    private String content;
    private String img;
    private String reg_date;
}
