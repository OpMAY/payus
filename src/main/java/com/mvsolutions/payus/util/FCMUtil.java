package com.mvsolutions.payus.util;

import com.mvsolutions.payus.model.rest.basic.NotificationJson;
import com.mvsolutions.payus.model.utility.fcm.NotificationNext;
import com.google.gson.Gson;

public class FCMUtil {
    // NotificationNext 세부 인자 받아서 여기서 생성 후 전송
    public static boolean sendFCMMessage(String fcm_token, String title, String content, int type, int content_type, int content_no, String json_content){
        try {
            FirebaseMessaging messaging = new FirebaseMessaging();
            NotificationJson json = new NotificationJson(type, content_type, content_no, json_content);
            messaging.push(fcm_token, title, content, new Gson().toJson(json));
            return true;
        } catch (Exception e){
            e.printStackTrace();
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
            e.printStackTrace();
            return false;
        }
    }
}
