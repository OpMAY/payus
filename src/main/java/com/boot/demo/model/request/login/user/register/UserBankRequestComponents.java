package com.boot.demo.model.request.login.user.register;

import lombok.Data;

@Data
public class UserBankRequestComponents{
    private int user_no;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
}