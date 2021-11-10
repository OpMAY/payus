package com.mvsolutions.payus.model.rest.request.loginpage.user;

import lombok.Data;

@Data
public class UserRegisterRequest {
    private int sns;
    private String access_token;
    private String fcm_token;
    private boolean marketing_agree;
}
