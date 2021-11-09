package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class NotificationVendor {
    private int notification_no;
    private int vendor_no;
    private int type;
    private String content;
    private String reg_date;
    private boolean read_check;
    // 추후 세팅 예정
    private String notification_json;
}
