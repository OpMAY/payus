package com.mvsolutions.payus.model.rest.response.suphomepage;

import lombok.Data;

@Data
public class ReviewAnswerNotificationData {
    private int user_no;
    private String user_name;
    private String store_name;
    private String review_content;
}
