package com.mvsolutions.payus.model.utility.fcm;

import lombok.Data;

@Data
public class Notification {
    private int notification_no;
    private int user_no;
    private String type;
    private String content;
    private String reg_date;
    private String next;
}
