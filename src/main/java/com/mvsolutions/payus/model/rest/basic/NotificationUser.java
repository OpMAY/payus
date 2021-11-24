package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;
import lombok.NonNull;

@Data
public class NotificationUser {
    private int notification_no;
    @NonNull
    private int user_no;
    @NonNull
    private int type;
    @NonNull
    private String content;
    @NonNull
    private String reg_date;
    private boolean read_check;
    @NonNull
    private String notification_json;
}
