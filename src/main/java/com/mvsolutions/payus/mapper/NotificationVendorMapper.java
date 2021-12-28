package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.NotificationVendor;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationDeleteRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorNotificationResponse;

import java.util.List;

public interface NotificationVendorMapper {
    List<VendorNotificationResponse> getNotificationListReload(int vendor_no, int type, int last_index);

    void deleteVendorNotification(VendorNotificationDeleteRequest request);

    void insertNotification(NotificationVendor notificationVendor);

    List<VendorNotificationResponse> getNotificationList(int vendor_no, int type);

    void updateReadCheck(List<VendorNotificationResponse> notificationList);

    boolean checkNotificationExists(int last_index);

    void updateByAnswerReview(int review_no);
}
