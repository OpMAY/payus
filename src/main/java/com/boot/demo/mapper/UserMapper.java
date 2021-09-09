package com.boot.demo.mapper;

import com.boot.demo.model.response.home.HomeUser;
import com.boot.demo.model.response.login.LoginCheck;
import com.boot.demo.model.response.login.UserRegistration;

public interface UserMapper {
    HomeUser getUserInfoByUserNoForHome(int user_no);

    LoginCheck getUserLogin(String access_token, String sns);

    void registerUser(UserRegistration newUser);
}
