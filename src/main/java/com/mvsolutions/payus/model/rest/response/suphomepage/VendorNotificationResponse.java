package com.mvsolutions.payus.model.rest.response.suphomepage;

import com.mvsolutions.payus.model.rest.basic.VendorNotificationJson;
import lombok.Data;

@Data
public class VendorNotificationResponse {
    private int notification_no;
    private int type;
    private String content;
    private String reg_date;
    private VendorNotificationJson notification_json;
    private boolean read_check;
}
