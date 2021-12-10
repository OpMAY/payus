package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class VendorNotificationJson {
    private int type;
    private int content_type;
    private int content_no;
    private String content;
    private Boolean answer_status;

    public VendorNotificationJson(){}

    public VendorNotificationJson(int type, int content_type, int content_no, String content, Boolean answer_status) {
        this.type = type;
        this.content_type = content_type;
        this.content_no = content_no;
        this.content = content;
        this.answer_status = answer_status;
    }
}
