package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserReviewDeleteRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorReviewContentResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyReviewResponse;

public interface ReviewMapper {
    VendorReviewContentResponse getReviewContentFromNotification(int review_no);

    boolean checkReviewExists(int review_no);

    boolean checkReviewAnswered(int review_no);

    void answerReview(VendorAnswerReviewRequest request);

    UserMyReviewResponse getReviewContentFromPointList(int accumulate_no);

    void deleteReviewByUser(UserReviewDeleteRequest request);
}
