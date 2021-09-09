package com.boot.demo.dao;

import com.boot.demo.mapper.UserMapper;
import com.boot.demo.model.response.home.HomeUser;
import com.boot.demo.model.response.login.LoginCheck;
import com.boot.demo.model.response.login.UserRegistration;
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
}
