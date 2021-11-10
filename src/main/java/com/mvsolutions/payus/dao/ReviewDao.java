package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.ReviewMapper;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorReviewContentResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public VendorReviewContentResponse getReviewContentFromNotification(int review_no) {
        ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
        return mapper.getReviewContentFromNotification(review_no);
    }

    public boolean checkReviewExists(int review_no) {
        ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
        return mapper.checkReviewExists(review_no);
    }

    public boolean checkReviewAnswered(int review_no) {
        ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
        return mapper.checkReviewAnswered(review_no);
    }

    public void answerReview(VendorAnswerReviewRequest request) {
        ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
        mapper.answerReview(request);
    }

//    private ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
}
