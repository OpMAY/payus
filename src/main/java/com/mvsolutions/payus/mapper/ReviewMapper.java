package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.ReviewUpdateModel;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.ReviewUploadRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserReviewDeleteRequest;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreReviewPageResponse;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorReviewContentResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyReviewResponse;

import java.util.List;

public interface ReviewMapper {
    VendorReviewContentResponse getReviewContentFromNotification(int review_no);

    boolean checkReviewExists(int review_no);

    boolean checkReviewAnswered(int review_no);

    void answerReview(VendorAnswerReviewRequest request);

    UserMyReviewResponse getReviewContentFromPointList(int accumulate_no);

    void deleteReviewByUser(UserReviewDeleteRequest request);

    void uploadReview(ReviewUploadRequest reviewUploadRequest);

    List<UserMyReviewResponse> getUserMyReviewList(int user_no, int review_type);

    List<UserMyReviewResponse> getUserMyReviewListReload(int user_no, int review_type, int last_index);

    int getStoreReviewNum(int store_no);

    List<StoreReviewPageResponse> getStoreReviewList(int store_no, int last_index);

    int getReviewRateSum(int store_no);

    int getStoreNoByReviewNo(int review_no);

    int getReviewNumByUserNo(int user_no);
}
