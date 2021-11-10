package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.response.suphomepage.VendorReviewContentResponse;

public interface ReviewMapper {
    VendorReviewContentResponse getReviewContentFromNotification(int review_no);

    boolean checkReviewExists(int review_no);

    boolean checkReviewAnswered(int review_no);

    void answerReview(VendorAnswerReviewRequest request);
}
