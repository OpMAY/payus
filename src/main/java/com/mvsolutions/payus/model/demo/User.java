package com.mvsolutions.payus.model.demo;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
public class User {
    private int user_no;
    private String name;
    private String profile_img;
    private String sns;
    private String access_token;
    private String email;
    private String phone;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
    private int point;
    private String reg_date;
}
