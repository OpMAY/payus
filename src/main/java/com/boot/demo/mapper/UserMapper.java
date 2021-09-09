package com.boot.demo.mapper;

import com.boot.demo.model.request.login.user.register.UserBankRequestComponents;
import com.boot.demo.model.response.home.HomeUser;
import com.boot.demo.model.response.login.user.LoginCheck;
import com.boot.demo.model.response.login.user.UserRegistration;

public interface UserMapper {
    HomeUser getUserInfoByUserNoForHome(int user_no);

    LoginCheck getUserLogin(String access_token, String sns);

    void registerUser(UserRegistration newUser);

    void bankUpdate(UserBankRequestComponents request);
}
