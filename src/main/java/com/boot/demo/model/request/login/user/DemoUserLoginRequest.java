package com.boot.demo.model.request.login.user;

import lombok.Data;

@Data
public class DemoUserLoginRequest {
    private UserLoginRequestComponents user;

    @Data
    public static class UserLoginRequestComponents{
        private String access_token;
        private String sns;
    }
}



