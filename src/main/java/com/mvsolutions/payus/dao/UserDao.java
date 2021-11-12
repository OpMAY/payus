package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.UserMapper;
import com.mvsolutions.payus.model.rest.basic.User;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserPointWithdrawRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserLoginResponse;
import com.mvsolutions.payus.model.rest.response.mainpage.MainPageUser;
import com.mvsolutions.payus.model.rest.response.suppointpage.PaybackUserDataResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyPagePersonalDataResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyPageResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserWithdrawPageResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public MainPageUser getUserForMainPage(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserForMainPage(user_no);
    }

    public boolean checkUserExists(int sns, String access_token) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.checkUserExists(sns, access_token);
    }

    public UserLoginResponse getUserForLogin(int sns, String access_token) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserForLogin(sns, access_token);
    }

    public void updateUserFcmToken(int user_no, String fcm_token) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.updateUserFcmToken(user_no, fcm_token);
    }

    public boolean checkUserPenalty(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.checkUserPenalty(user_no);
    }

    public String getUserName(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserName(user_no);
    }

    public void registerUser(User user) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.registerUser(user);
    }

    public void updateUserName(int user_no, String nickname) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.updateUserName(user_no, nickname);
    }

    public PaybackUserDataResponse getUserDataForPayback(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserDataForPayback(user_no);
    }

    public void requestPayback(PaybackRequest request) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.requestPayback(request);
    }

    public UserMyPageResponse getUserMyPageData(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserMyPageData(user_no);
    }

    public UserWithdrawPageResponse getUserDataForWithdraw(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserDataForWithdraw(user_no);
    }

    public int getUserPoint(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserPoint(user_no);
    }

    public void updatePointWithdraw(UserPointWithdrawRequest request) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        mapper.updatePointWithdraw(request);
    }

    public UserMyPagePersonalDataResponse getUserMyPagePersonalData(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.getUserMyPagePersonalData(user_no);
    }

    public boolean checkUserExistsByUserNo(int user_no) {
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return mapper.checkUserExistsByUserNo(user_no);
    }
}
