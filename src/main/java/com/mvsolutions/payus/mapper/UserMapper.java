package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.User;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserPointWithdrawRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserLoginResponse;
import com.mvsolutions.payus.model.rest.response.mainpage.MainPageUser;
import com.mvsolutions.payus.model.rest.response.suppointpage.PaybackUserDataResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyPagePersonalDataResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyPageResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserWithdrawPageResponse;

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

    UserMyPageResponse getUserMyPageData(int user_no);

    UserWithdrawPageResponse getUserDataForWithdraw(int user_no);

    int getUserPoint(int user_no);

    void updatePointWithdraw(UserPointWithdrawRequest request);

    UserMyPagePersonalDataResponse getUserMyPagePersonalData(int user_no);

    boolean checkUserExistsByUserNo(int user_no);

    void editUserNickName(int user_no, String data);

    void editUserPhone(int user_no, String data);

    void editUserBankName(int user_no, String data);

    void editUserBankAccount(int user_no, String data);

    void editUserBankOwner(int user_no, String data);

    boolean updateUserEventPush(int user_no);

    boolean updateUserReviewPush(int user_no);

    boolean updateUserPointPush(int user_no);

    boolean updateUserReportPush(int user_no);

    boolean updateMarketingAgree(int user_no);

    boolean checkUserNickNameExists(String nickname);

    String getUserFCMToken(int user_no);
}
