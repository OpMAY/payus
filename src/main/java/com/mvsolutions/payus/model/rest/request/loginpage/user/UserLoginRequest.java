package com.mvsolutions.payus.model.rest.request.loginpage.user;

import lombok.Data;

@Data
public class UserLoginRequest {
    private int sns;
    private String access_token;
    private String fcm_token;
}
