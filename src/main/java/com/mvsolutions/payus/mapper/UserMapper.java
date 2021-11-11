package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.User;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserLoginResponse;
import com.mvsolutions.payus.model.rest.response.mainpage.MainPageUser;
import com.mvsolutions.payus.model.rest.response.suppointpage.PaybackUserDataResponse;

public interface UserMapper {

    MainPageUser getUserForMainPage(int user_no);

    boolean checkUserExists(int sns, String access_token);

    UserLoginResponse getUserForLogin(int sns, String access_token);

    void updateUserFcmToken(int user_no, String fcm_token);

    boolean checkUserPenalty(int user_no);

    String getUserName(int user_no);

    void registerUser(User user);

    void updateUserName(int user_no, String nickname);

    PaybackUserDataResponse getUserDataForPayback(int user_no);

    void requestPayback(PaybackRequest request);
}
