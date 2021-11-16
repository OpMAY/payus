package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointWithdrawMapper;
import com.mvsolutions.payus.model.rest.request.usermypage.UserPointWithdrawRequest;
import com.mvsolutions.payus.model.rest.response.usermypage.UserPointWithdrawListResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PointWithdrawDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public void requestWithdraw(UserPointWithdrawRequest request) {
        PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
        mapper.requestWithdraw(request);
    }

    public List<UserPointWithdrawListResponse> getUserPointWithdrawList(int user_no) {
        PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
        return mapper.getUserPointWithdrawList(user_no);
    }

    public void updateUserReadCheck(List<UserPointWithdrawListResponse> withdrawList) {
        PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
        mapper.updateUserReadCheck(withdrawList);
    }

    public List<UserPointWithdrawListResponse> getUserPointWithdrawListReload(int user_no, int last_index) {
        PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
        return mapper.getUserPointWithdrawListReload(user_no, last_index);
    }

    public boolean checkWithdrawRejected(int withdraw_no) {
        PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
        return mapper.checkWithdrawRejected(withdraw_no);
    }

//    private PointWithdrawMapper mapper = sqlSession.getMapper(PointWithdrawMapper.class);
}
