package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class User {
    private int user_no;
    private int sns;
    private String access_token;
    private String fcm_token;
    private String reg_date;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
    private String nickname;
    private String phone;
    private boolean event_push;
    private boolean review_push;
    private boolean point_push;
    private boolean report_push;
    private boolean service_agree;
    private boolean marketing_agree;
    private int point;
    private boolean user_penalty;
}
