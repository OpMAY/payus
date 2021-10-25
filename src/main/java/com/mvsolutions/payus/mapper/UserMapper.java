package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.demo.request.login.user.register.UserBankRequestComponents;
import com.mvsolutions.payus.model.demo.response.home.HomeUser;
import com.mvsolutions.payus.model.demo.response.login.user.LoginCheck;
import com.mvsolutions.payus.model.demo.response.login.user.UserRegistration;
import com.mvsolutions.payus.model.demo.response.setting.BankInfoEditRequest;
import com.mvsolutions.payus.model.demo.response.setting.UserShortInfoResponse;
import com.mvsolutions.payus.model.demo.response.setting.UserSpecificInfoResponse;

public interface UserMapper {
    HomeUser getUserInfoByUserNoForHome(int user_no);

    LoginCheck getUserLogin(String access_token, String sns);

    void registerUser(UserRegistration newUser);

    void bankUpdate(UserBankRequestComponents request);

    UserShortInfoResponse getUserShortData(int user_no);

    UserSpecificInfoResponse getUserProfile(int user_no);

    void updateUserPersonal(int user_no, String phone);

    void updateUserBank(int user_no, BankInfoEditRequest.BankInfoEditComponents bank);
}
