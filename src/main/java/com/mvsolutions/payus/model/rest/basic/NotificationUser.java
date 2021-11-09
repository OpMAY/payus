package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class NotificationUser {
    private int notification_no;
    private int user_no;
    private int type;
    private String content;
    private String reg_date;
    private boolean read_check;
    private String notification_json;
}
