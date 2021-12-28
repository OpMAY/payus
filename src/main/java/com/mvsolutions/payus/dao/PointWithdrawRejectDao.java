package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointWithdrawRejectMapper;
import com.mvsolutions.payus.model.rest.response.usermypage.UserPointRejectReasonResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointWithdrawRejectDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public UserPointRejectReasonResponse getWithdrawRejectReason(int withdraw_no) {
        PointWithdrawRejectMapper mapper = sqlSession.getMapper(PointWithdrawRejectMapper.class);
        return mapper.getWithdrawRejectReason(withdraw_no);
    }

//    private PointWithdrawRejectMapper mapper = sqlSession.getMapper(PointWithdrawRejectMapper.class);
}
