package com.mvsolutions.payus.response.payus.notification;

import com.mvsolutions.payus.exception.enums.BusinessExceptionType;
import com.mvsolutions.payus.exception.rest.GrantAccessDeniedException;

public class FCMTitle {
    public static String getFCMTitle(int type, boolean user) {
        if (user) {
            switch (type) {
                case NotificationUserType.WARNING:
                    return "경고 알림";
                case NotificationUserType.PAYBACK:
                    return "페이백 알림";
                case NotificationUserType.POINT:
                    return "포인트 알림";
                case NotificationUserType.EVENT:
                    return "이벤트 알림";
                case NotificationUserType.REVIEW:
                    return "리뷰 알림";
                case NotificationUserType.ETC:
                    return "기타 알림";
                default:
                    throw new GrantAccessDeniedException(BusinessExceptionType.NOTIFICATION_TYPE_ERROR);
            }
        } else {
            switch (type) {
                case NotificationVendorType.WARNING:
                    return "경고 알림";
                case NotificationVendorType.POINT:
                    return "포인트 알림";
                case NotificationVendorType.EVENT:
                    return "이벤트 알림";
                case NotificationVendorType.REVIEW:
                    return "리뷰 알림";
                case NotificationVendorType.ETC:
                    return "기타 알림";
                default:
                    throw new GrantAccessDeniedException(BusinessExceptionType.NOTIFICATION_TYPE_ERROR);
            }
        }
    }
}
