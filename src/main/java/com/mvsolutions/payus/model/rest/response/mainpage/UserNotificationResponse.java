package com.mvsolutions.payus.model.rest.response.mainpage;

import com.mvsolutions.payus.model.rest.basic.UserNotificationJson;
import com.mvsolutions.payus.response.payus.notification.VendorNotificationJson;
import lombok.Data;

@Data
public class UserNotificationResponse {
    private int notification_no;
    private int type;
    private String content;
    private String reg_date;
    private UserNotificationJson notification_json;
}
