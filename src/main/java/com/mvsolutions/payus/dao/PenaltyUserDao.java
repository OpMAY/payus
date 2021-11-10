package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PenaltyUserMapper;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserPenaltyResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PenaltyUserDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<UserPenaltyResponse> getUserPenaltyInfo(int user_no) {
        PenaltyUserMapper mapper = sqlSession.getMapper(PenaltyUserMapper.class);
        return mapper.getUserPenaltyInfo(user_no);
    }

//    private PenaltyUserMapper mapper = sqlSession.getMapper(PenaltyUserMapper.class);
}
