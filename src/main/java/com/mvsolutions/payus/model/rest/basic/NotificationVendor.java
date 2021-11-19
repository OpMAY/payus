package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;
import lombok.NonNull;

@Data
public class NotificationVendor {
    private int notification_no;
    @NonNull
    private int vendor_no;
    @NonNull
    private int type;
    @NonNull
    private String content;
    @NonNull
    private String reg_date;
    private boolean read_check;
    // 추후 세팅 예정
    @NonNull
    private String notification_json;
}
