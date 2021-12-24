package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.PointAccumulateMapper;
import com.mvsolutions.payus.model.rest.basic.PointAccumulate;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserReviewDeleteRequest;
import com.mvsolutions.payus.model.rest.response.storedetailpage.UserAccumulateCheckResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointAccumulateCheckBan;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointAccumulateListResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserPointAccumulateListResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserReviewPagePreDataResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PointAccumulateDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<VendorPointAccumulateListResponse> getVendorAccumulateList(int vendor_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.getVendorAccumulateList(vendor_no);
    }

    public List<VendorPointAccumulateListResponse> getVendorAccumulateListReload(int vendor_no, int last_index) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.getVendorAccumulateListReload(vendor_no, last_index);
    }

    public PointAccumulate getPointAccumulateByAccumulateNo(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.getPointAccumulateByAccumulateNo(accumulate_no);
    }

    public boolean checkPointAbleToCancel(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.checkPointAbleToCancel(accumulate_no);
    }

    public void pointCancelRequestUpdate(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.pointCancelRequestUpdate(accumulate_no);
    }

    public void updateVendorReadCheck(List<VendorPointAccumulateListResponse> accumulateList) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.updateVendorReadCheck(accumulateList);
    }

    public void requestPayback(PaybackRequest request) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.requestPayback(request);
    }

    public List<UserPointAccumulateListResponse> getUserPointAccumulateList(int user_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.getUserPointAccumulateList(user_no);
    }

    public void updateUserReadCheck(List<UserPointAccumulateListResponse> accumulateList) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.updateUserReadCheck(accumulateList);
    }

    public List<UserPointAccumulateListResponse> getUserPointAccumulateListReload(int user_no, int last_index) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.getUserPointAccumulateListReload(user_no, last_index);
    }

    public void updateAccumulateByReviewDelete(UserReviewDeleteRequest request) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.updateAccumulateByReviewDelete(request);
    }

    public VendorPointAccumulateCheckBan getPreDataForReview(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.getPreDataForReview(accumulate_no);
    }

    public boolean checkReviewWritten(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.checkReviewWritten(accumulate_no);
    }

    public void updateAccumulateByUploadReview(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.updateAccumulateByUploadReview(accumulate_no);
    }

    public UserAccumulateCheckResponse checkUserAccumulate(int user_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.checkUserAccumulate(user_no);
    }

    public int getStoreNoFromAccumulate(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.getStoreNoFromAccumulate(accumulate_no);
    }

    public boolean checkAccumulateCanceled(int content_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.checkAccumulateCanceled(content_no);
    }

    public boolean checkUserUnreadExists(int user_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        return mapper.checkUserUnreadExists(user_no);
    }

    public void updateUserReadCheckByVendorReviewAnswer(int review_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.updateUserReadCheckByVendorReviewAnswer(review_no);
    }

    public void updateUserReadCheckAccumulate(int accumulate_no) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.updateUserReadCheckAccumulate(accumulate_no);
    }

    public void updateAnswerDate(VendorAnswerReviewRequest request) {
        PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
        mapper.updateAnswerDate(request);
    }

//    private PointAccumulateMapper mapper = sqlSession.getMapper(PointAccumulateMapper.class);
}
