package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.ReviewMapper;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserReviewDeleteRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorReviewContentResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyReviewResponse;
import org.apache.ibatis.session.SqlSession;
import org.bouncycastle.cert.ocsp.Req;
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

    public UserMyReviewResponse getReviewContentFromPointList(int accumulate_no) {
        ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
        return mapper.getReviewContentFromPointList(accumulate_no);
    }

    public void deleteReviewByUser(UserReviewDeleteRequest request) {
        ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
        mapper.deleteReviewByUser(request);
    }

//    private ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
}
