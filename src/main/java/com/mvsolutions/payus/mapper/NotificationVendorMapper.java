package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationDeleteRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorNotificationResponse;

import java.util.List;

public interface NotificationVendorMapper {
    List<VendorNotificationResponse> getNotificationList(VendorNotificationRequest request);

    void deleteVendorNotification(VendorNotificationDeleteRequest request);

}
