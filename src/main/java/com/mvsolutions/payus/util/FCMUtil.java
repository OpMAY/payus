package com.mvsolutions.payus.util;

import com.mvsolutions.payus.model.rest.basic.NotificationJson;
import com.mvsolutions.payus.model.rest.basic.UserNotificationJson;
import com.mvsolutions.payus.model.rest.basic.VendorNotificationJson;
import com.mvsolutions.payus.model.utility.fcm.NotificationNext;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class FCMUtil {
    // NotificationNext 세부 인자 받아서 여기서 생성 후 전송
    public static boolean sendFCMMessage(String fcm_token, String title, String content, int type, int content_type, int content_no, String json_content, Boolean review_status, Boolean answer_status, boolean user){
        try {
            FirebaseMessaging messaging = new FirebaseMessaging();
            String jsonString;
            if(user){
                UserNotificationJson json = new UserNotificationJson(type, content_type, content_no, json_content, review_status);
                jsonString = new Gson().toJson(json);
            } else {
                VendorNotificationJson json = new VendorNotificationJson(type, content_type, content_no, json_content, answer_status);
                jsonString = new Gson().toJson(json);
            }
            messaging.push(fcm_token, title, content, jsonString);
            return true;
        } catch (Exception e){
            log.error("", e);
            return false;
        }
    }

    // 생성된 NotificationNext 받아서 이용
    public static boolean sendFCMMessage(String fcm_token, String title, String content, String notification_json){
        try {
            FirebaseMessaging messaging = new FirebaseMessaging();
            messaging.push(fcm_token, title, content, notification_json);
            return true;
        } catch (Exception e){
            log.error("", e);
            return false;
        }
    }
}
