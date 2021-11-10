package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.ReviewDao;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorReviewContentResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Log4j
@Service
public class ReviewService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private ReviewDao reviewDao;

    @Transactional(readOnly = true)
    public ResponseEntity getReviewContentFromNotification(int review_no) throws JSONException {
        Message message = new Message();
        reviewDao.setSqlSession(sqlSession);
        if (!reviewDao.checkReviewExists(review_no)) {
            // 삭제된 리뷰일 시
            return new ResponseEntity(StringRes.res(StatusCode.DELETED_CONTENT), HttpStatus.OK);
        } else if (reviewDao.checkReviewAnswered(review_no)) {
            // 이미 답변한 리뷰에 접근할 시
            return new ResponseEntity(StringRes.res(StatusCode.ALREADY_ANSWERED), HttpStatus.OK);
        }
        VendorReviewContentResponse response = reviewDao.getReviewContentFromNotification(review_no);
        message.put("review", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getReviewContentFromNotification()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity answerReview(VendorAnswerReviewRequest request) {
        reviewDao.setSqlSession(sqlSession);
        if (!reviewDao.checkReviewExists(request.getReview_no())) {
            // 삭제된 리뷰일 시
            return new ResponseEntity(StringRes.res(StatusCode.DELETED_CONTENT), HttpStatus.OK);
        } else if (reviewDao.checkReviewAnswered(request.getReview_no())) {
            // 이미 답변한 리뷰에 접근할 시
            return new ResponseEntity(StringRes.res(StatusCode.ALREADY_ANSWERED), HttpStatus.OK);
        }
        request.setAnswer_date(Time.TimeFormatHMS());
        reviewDao.answerReview(request);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }
}
