package com.boot.demo.dao;

import com.boot.demo.mapper.UserMapper;
import com.boot.demo.model.demo.request.login.user.register.UserBankRequestComponents;
import com.boot.demo.model.demo.response.home.HomeUser;
import com.boot.demo.model.demo.response.login.user.LoginCheck;
import com.boot.demo.model.demo.response.login.user.UserRegistration;
import com.boot.demo.model.demo.response.setting.BankInfoEditRequest;
import com.boot.demo.model.demo.response.setting.UserShortInfoResponse;
import com.boot.demo.model.demo.response.setting.UserSpecificInfoResponse;
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

    public HomeUser getUserInfoByUserNoForHome(int user_no){
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getUserInfoByUserNoForHome(user_no);
    }

    public LoginCheck getUserLogin(String access_token, String sns){
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getUserLogin(access_token, sns);
    }

    public void registerUser(UserRegistration newUser) {
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.registerUser(newUser);
    }

    public void bankUpdate(UserBankRequestComponents request) {
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.bankUpdate(request);
    }

    public UserShortInfoResponse getUserShortData(int user_no) {
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getUserShortData(user_no);
    }

    public UserSpecificInfoResponse getUserProfile(int user_no) {
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        return userMapper.getUserProfile(user_no);
    }

    public void updateUserPersonal(int user_no, String phone) {
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.updateUserPersonal(user_no, phone);
    }

    public void updateUserBank(int user_no, BankInfoEditRequest.BankInfoEditComponents bank) {
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.updateUserBank(user_no, bank);
    }
}
