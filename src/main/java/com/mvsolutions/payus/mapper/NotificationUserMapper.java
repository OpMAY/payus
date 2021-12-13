package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.NotificationUser;
import com.mvsolutions.payus.model.rest.response.mainpage.UserNotificationResponse;

import java.util.List;

public interface NotificationUserMapper {
    boolean checkUserNotificationUnread(int user_no);

    void insertNotification(NotificationUser notificationUser);

    boolean checkUserNotificationExists(int last_index);

    List<UserNotificationResponse> getUserNotification(int user_no, int type);

    List<UserNotificationResponse> getUserNotificationReload(int user_no, int type, int last_index);

    void updateReadCheck(List<UserNotificationResponse> notificationList);

    void updateNotificationByUploadReview(int accumulate_no);
}
