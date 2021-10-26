package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.demo.Review;
import com.mvsolutions.payus.model.demo.response.detail.ReviewStoreUpdate;
import com.mvsolutions.payus.model.demo.response.detail.StoreReviewComponents;

import java.util.List;

public interface ReviewMapper {
    void insertReviews(List<Review> reviewList);

    List<ReviewStoreUpdate> getSimpleReviewList(int store_no);

    List<StoreReviewComponents> getReviewsForDetail(int store_no);

    void updateImages(String image_list);

    void answerReview(int review_no, String answer_content, String answer_date);
}
