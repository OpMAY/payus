package com.mvsolutions.payus.model.rest.request.suphomepage;

import lombok.Data;

@Data
public class VendorNotificationRequest {
    private int vendor_no;
    private int type;
    private int last_index;
}
