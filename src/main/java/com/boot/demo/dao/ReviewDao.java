package com.boot.demo.dao;

import com.boot.demo.mapper.ReviewMapper;
import com.boot.demo.model.Review;
import com.boot.demo.model.response.detail.ReviewStoreUpdate;
import com.boot.demo.model.response.detail.StoreReviewComponents;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public void insertReviews(List<Review> reviewList) {
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        reviewMapper.insertReviews(reviewList);
    }

    public List<ReviewStoreUpdate> getSimpleReviewList(int store_no){
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        return reviewMapper.getSimpleReviewList(store_no);
    }

    public List<StoreReviewComponents> getReviewsForDetail(int store_no){
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        return reviewMapper.getReviewsForDetail(store_no);
    }

    public void updateImages(String image_list){
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        reviewMapper.updateImages(image_list);
    }

    public void answerReview(int review_no, String answer_content, String answer_date) {
        ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
        reviewMapper.answerReview(review_no, answer_content, answer_date);
    }
}
