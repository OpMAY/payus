package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class NotificationJson {
    private int type;
    private int content_type;
    private int content_no;
    private String content;

    public NotificationJson(){}

    public NotificationJson(int type, int content_type, int content_no, String content) {
        this.type = type;
        this.content_type = content_type;
        this.content_no = content_no;
        this.content = content;
    }

}
