package com.mvsolutions.payus.util;


import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.google.firebase.messaging.TopicManagementResponse;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.util.List;

@Log4j2
@Service
public class FirebaseMessaging {
    //초기화
    public void initFirebase() {
        try {
            // Remote
            FileInputStream refreshToken = new FileInputStream("/var/lib/tomcat8/webapps/ROOT/WEB-INF/classes/private/payus-307315-firebase-adminsdk-e98c2-9b9f5c5d52.json");
            // Local
            //FileInputStream refreshToken = new FileInputStream("E:/Projects/payus/src/main/resources/private/payus-307315-firebase-adminsdk-e98c2-9b9f5c5d52.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(refreshToken))
                    .build();

            //Firebase 처음 호출시에만 initailizing 처리
            if (FirebaseApp.getApps().isEmpty())
                FirebaseApp.initializeApp(options);
            refreshToken.close();
        } catch (Exception e) {
            System.out.println("notification error: " + e);
            e.printStackTrace();
        }
    }

    public void test_sendAll_FCM(List<String> tokenId, String title, String content) {
        try {
            initFirebase();

            String topic = "push";

//            for(int i = 0; i<tokenId.size(); i++){
//                test_send_FCM(tokenId.get(i), "바꿔먹어", content, request);
//                System.out.println("tokenId: " + tokenId.get(i));
//            }

            TopicManagementResponse response = com.google.firebase.messaging.FirebaseMessaging.getInstance().subscribeToTopic(tokenId, topic);
            System.out.println(response.getSuccessCount() + " tokens were subscribed successfully");

            Notification notification = new Notification(title, content);

            //message 작성
            Message msg = Message.builder()
                    .setNotification(notification)
                    .setTopic(topic)
                    .build();

            // Send a message to the devices subscribed to the provided topic.
            String firbaseResponse = com.google.firebase.messaging.FirebaseMessaging.getInstance().send(msg);
            // Response is a message ID string.
            System.out.println("Successfully sent message: " + firbaseResponse);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void push(String tokenId, String title, String content, String next) {
        try {
            Notification notification = new Notification(title, content);
            initFirebase();

            //안드로이드 토큰 입력

            //message 작성
            Message msg = Message.builder()
                    .setNotification(notification)
                    .setToken(tokenId)
                    .putData("next", next)
                    .build();

            //메세지를 FirebaseMessageing에 보내기
            String response = com.google.firebase.messaging.FirebaseMessaging.getInstance().send(msg);
            //결과 출력
            log.info("Successfully sent message: " + response);

            log.info("notification 통과");
        } catch (Exception e) {
            log.info("notification error: " + e);
            e.printStackTrace();
        }
    }
}
