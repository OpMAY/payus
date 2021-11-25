package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class UserNotificationJson {
    private int type;
    private int content_type;
    private int content_no;
    private String content;
}
