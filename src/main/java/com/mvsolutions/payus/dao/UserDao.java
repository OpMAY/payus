package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.UserMapper;
import com.mvsolutions.payus.model.rest.response.MainPageUser;
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
}
