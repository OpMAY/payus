package com.mvsolutions.payus.model.demo.response.login.user;

import lombok.Data;

@Data
public class UserRegistration {
    private int user_no;
    private String name;
    private String access_token;
    private String sns;
    private String reg_date;
}
