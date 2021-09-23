package com.boot.demo.model.demo.response.setting;

import lombok.Data;

@Data
public class UserSpecificInfoResponse {
    private int user_no;
    private String name;
    private String email;
    private String phone;
    private String profile_img;
    private String bank_name;
    private String bank_owner;
    private String bank_account;
}
