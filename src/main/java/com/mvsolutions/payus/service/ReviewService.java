package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.PointAccumulateDao;
import com.mvsolutions.payus.dao.ReviewDao;
import com.mvsolutions.payus.dao.StoreDao;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.ReviewUploadRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserReviewDeleteRequest;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreReviewPageResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorReviewContentResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyReviewResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserReviewPagePreDataResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.user.ReviewListType;
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

import java.util.List;

@Log4j
@Service
public class ReviewService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private ReviewDao reviewDao;

    @Autowired
    private PointAccumulateDao pointAccumulateDao;

    @Autowired
    private StoreDao storeDao;

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
        pointAccumulateDao.setSqlSession(sqlSession);
        if (!reviewDao.checkReviewExists(request.getReview_no())) {
            // 삭제된 리뷰일 시
            return new ResponseEntity(StringRes.res(StatusCode.DELETED_CONTENT), HttpStatus.OK);
        } else if (reviewDao.checkReviewAnswered(request.getReview_no())) {
            // 이미 답변한 리뷰에 접근할 시
            return new ResponseEntity(StringRes.res(StatusCode.ALREADY_ANSWERED), HttpStatus.OK);
        }
        request.setAnswer_date(Time.TimeFormatHMS());
        reviewDao.answerReview(request);
        pointAccumulateDao.updateAnswerDate(request);
        // 포인트 적립 내역의 유저 읽기 여부 false로 전환
        pointAccumulateDao.updateUserReadCheckByVendorReviewAnswer(request.getReview_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getReviewContentFromPointList(int accumulate_no) throws JSONException {
        Message message = new Message();
        reviewDao.setSqlSession(sqlSession);
        pointAccumulateDao.setSqlSession(sqlSession);
        UserMyReviewResponse response = reviewDao.getReviewContentFromPointList(accumulate_no);
        if (response == null) {
            // 삭제된 리뷰에 접근 했을 때 D404
            return new ResponseEntity(StringRes.res(StatusCode.DELETED_CONTENT), HttpStatus.OK);
        }
        // 리뷰를 확인하였으니, 해당 리뷰에 대하여 읽음으로 처리함.
        pointAccumulateDao.updateUserReadCheckAccumulate(accumulate_no);
        message.put("review", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getReviewContentFromPointList()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity deleteReviewByUser(UserReviewDeleteRequest request) {
        reviewDao.setSqlSession(sqlSession);
        pointAccumulateDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);
        if (!reviewDao.checkReviewExists(request.getReview_no())) {
            // 이미 삭제된 리뷰를 삭제하려고 하는 경우 D404
            return new ResponseEntity(StringRes.res(StatusCode.DELETED_CONTENT), HttpStatus.OK);
        }
        // 포인트 내역에 리뷰 작성 여부 false 로 전환
        pointAccumulateDao.updateAccumulateByReviewDelete(request);
        // 삭제 전 상점 업데이트를 위한 store_no 받기
        int store_no = reviewDao.getStoreNoByReviewNo(request.getReview_no());
        // 리뷰 삭제
        reviewDao.deleteReviewByUser(request);
        // 상점에 정보 업데이트
        // 별점 총합 / 리뷰 갯수 = 평균 별점
        int rateSum = reviewDao.getReviewRateSum(store_no);
        int reviewNum = reviewDao.getStoreReviewNum(store_no);
        float rateAvg;
        if (reviewNum != 0) {
            rateAvg = (float) rateSum / reviewNum;
        } else {
            rateAvg = 0;
        }
        // 리뷰 갯수 적용
        storeDao.updateStoreByReview(store_no, reviewNum, rateAvg);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getUserReviewPagePreData(int accumulate_no) throws JSONException {
        Message message = new Message();
        pointAccumulateDao.setSqlSession(sqlSession);
        UserReviewPagePreDataResponse response = pointAccumulateDao.getPreDataForReview(accumulate_no);
        message.put("pre_data", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserReviewPagePreData()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity uploadReview(ReviewUploadRequest reviewUploadRequest) throws JSONException {
        Message message = new Message();
        reviewDao.setSqlSession(sqlSession);
        pointAccumulateDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);

        // 리뷰 전에 작성한 적이 있는지 확인
        if (pointAccumulateDao.checkReviewWritten(reviewUploadRequest.getAccumulate_no())) {
            return new ResponseEntity(StringRes.res(StatusCode.ALREADY_REVIEWED), HttpStatus.OK);
        }
        reviewUploadRequest.setReg_date(Time.TimeFormatHMS());
        reviewDao.uploadReview(reviewUploadRequest);
        pointAccumulateDao.updateAccumulateByUploadReview(reviewUploadRequest.getAccumulate_no());
        int store_no = pointAccumulateDao.getStoreNoFromAccumulate(reviewUploadRequest.getAccumulate_no());
        // 별점 총합 / 리뷰 갯수 = 평균 별점
        int rateSum = reviewDao.getReviewRateSum(store_no);
        int reviewNum = reviewDao.getStoreReviewNum(store_no);
        float rateAvg = (float) rateSum / reviewNum;
        // 리뷰 갯수 적용
        storeDao.updateStoreByReview(store_no, reviewNum, rateAvg);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("uploadReview()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getUserReviewList(int user_no) throws JSONException {
        Message message = new Message();
        reviewDao.setSqlSession(sqlSession);
        // 리뷰 총 갯수
        int review_num = reviewDao.getReviewNumByUserNo(user_no);
        message.put("review_num", review_num);

        // 전체, 응답, 미응답 순
        List<UserMyReviewResponse> allReviewList = reviewDao.getUserMyReviewList(user_no, ReviewListType.ALL);
        List<UserMyReviewResponse> answeredReviewList = reviewDao.getUserMyReviewList(user_no, ReviewListType.ANSWERED);
        List<UserMyReviewResponse> notAnsweredReviewList = reviewDao.getUserMyReviewList(user_no, ReviewListType.NOT_ANSWERED);
        message.put("review0", allReviewList);
        message.put("review1", answeredReviewList);
        message.put("review2", notAnsweredReviewList);
        if (allReviewList.size() > 0)
            message.put("last_index0", allReviewList.get(allReviewList.size() - 1).getReview_no());
        if (answeredReviewList.size() > 0)
            message.put("last_index1", answeredReviewList.get(answeredReviewList.size() - 1).getReview_no());
        if (notAnsweredReviewList.size() > 0)
            message.put("last_index2", notAnsweredReviewList.get(notAnsweredReviewList.size() - 1).getReview_no());

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserReviewList()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getUserReviewListReload(int user_no, int review_type, int last_index) throws JSONException {
        Message message = new Message();
        reviewDao.setSqlSession(sqlSession);
        if (!reviewDao.checkReviewExists(last_index)) {
            // 리로딩 last_index 에 해당하는 컨텐츠 없을 때 R400
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }
        List<UserMyReviewResponse> reviewList = reviewDao.getUserMyReviewListReload(user_no, review_type, last_index);
        message.put("review", reviewList);
        if (reviewList.size() > 0)
            message.put("last_index", reviewList.get(reviewList.size() - 1).getReview_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserReviewListReload()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getStoreReviewListPage(int store_no, int last_index) throws JSONException {
        Message message = new Message();
        reviewDao.setSqlSession(sqlSession);
        if (last_index != 0 && !reviewDao.checkReviewExists(last_index)) {
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }
        int review_num = reviewDao.getStoreReviewNum(store_no);
        message.put("review_num", review_num);
        List<StoreReviewPageResponse> reviewList = reviewDao.getStoreReviewList(store_no, last_index);
        message.put("review", reviewList);
        if (reviewList.size() > 0)
            message.put("last_index", reviewList.get(reviewList.size() - 1).getReview_no());

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getStoreReviewListPage()")), HttpStatus.OK);
    }
}
