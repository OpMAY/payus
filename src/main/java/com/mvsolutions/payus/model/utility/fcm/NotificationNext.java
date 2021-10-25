package com.mvsolutions.payus.model.utility.fcm;

import lombok.Data;

@Data
public class NotificationNext {
    private String type;
    private String content_type;
    private String content_category;
    private int content_no;
    private String admin_type;

    public NotificationNext(){
    }

    public NotificationNext(String type, String content_type, String content_category, int content_no, String admin_type){
        this.type = type;
        this.content_type = content_type;
        this.content_category = content_category;
        this.content_no = content_no;
        this.admin_type = admin_type;
    }
}
