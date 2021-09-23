package com.boot.demo.mapper;

import com.boot.demo.model.demo.Review;
import com.boot.demo.model.demo.response.detail.ReviewStoreUpdate;
import com.boot.demo.model.demo.response.detail.StoreReviewComponents;

import java.util.List;

public interface ReviewMapper {
    void insertReviews(List<Review> reviewList);

    List<ReviewStoreUpdate> getSimpleReviewList(int store_no);

    List<StoreReviewComponents> getReviewsForDetail(int store_no);

    void updateImages(String image_list);

    void answerReview(int review_no, String answer_content, String answer_date);
}
