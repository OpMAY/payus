package com.mvsolutions.payus.util;

import com.mvsolutions.payus.model.utility.fcm.NotificationNext;
import com.google.gson.Gson;

public class FCMUtil {
    // NotificationNext 세부 인자 받아서 여기서 생성 후 전송
    public boolean sendFCMMessage(String fcm_token, String title, String content, String type, String content_type, String content_category, int content_no, String admin_type){
        try {
            FirebaseMessaging messaging = new FirebaseMessaging();
            NotificationNext next = new NotificationNext(type, content_type, content_category, content_no, admin_type);
            messaging.push(fcm_token, title, content, new Gson().toJson(next));
            return true;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    // 생성된 NotificationNext 받아서 이용
    public boolean sendFCMMessage(String fcm_token, String title, String content, NotificationNext next){
        try {
            FirebaseMessaging messaging = new FirebaseMessaging();
            messaging.push(fcm_token, title, content, new Gson().toJson(next));
            return true;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
