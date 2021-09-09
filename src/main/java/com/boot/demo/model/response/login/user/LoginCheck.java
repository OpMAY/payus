package com.boot.demo.model.response.login.user;

import lombok.Data;

@Data
public class LoginCheck {
    private int user_no;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
}
