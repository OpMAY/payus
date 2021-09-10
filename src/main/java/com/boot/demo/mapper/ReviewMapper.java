package com.boot.demo.mapper;

import com.boot.demo.model.Review;
import com.boot.demo.model.response.detail.ReviewStoreUpdate;
import com.boot.demo.model.response.detail.StoreReviewComponents;

import java.util.List;

public interface ReviewMapper {
    void insertReviews(List<Review> reviewList);

    List<ReviewStoreUpdate> getSimpleReviewList(int store_no);

    List<StoreReviewComponents> getReviewsForDetail(int store_no);

    void updateImages(String image_list);
}
