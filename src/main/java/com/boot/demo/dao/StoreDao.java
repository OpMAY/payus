package com.boot.demo.dao;

import com.boot.demo.mapper.StoreMapper;
import com.boot.demo.model.demo.Store;
import com.boot.demo.model.demo.response.detail.StoreDetailResponse;
import com.boot.demo.model.demo.response.home.HomePaybackStore;
import com.boot.demo.model.demo.response.main.RecommendedStore;
import com.boot.demo.model.demo.response.main.StoreNoCheck;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StoreDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<HomePaybackStore> getStoreRandomListForHome() {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreRandomListForHome();
    }

    public List<HomePaybackStore> getStoreListOrderByPaybackRatioForHome() {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreListOrderByPaybackRatioForHome();
    }

    public void insertStores(Store store) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        storeMapper.insertStores(store);
    }

    public List<HomePaybackStore> getStoreRandomListForMain(String x, String y, int category) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreRandomListForMain(x, y, category);
    }

    public StoreNoCheck checkStoreIsValid(int last_index) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.checkStoreIsValid(last_index);
    }

    public List<RecommendedStore> getStoreRecommendListForMain(String x, String y, int category) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreRecommendListForMain(x, y, category);
    }

    public List<RecommendedStore> getStoreRecommendListForMainReload(String x, String y, int category, int last_index, double last_distance) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreRecommendListForMainReload(x, y, category, last_index, last_distance);
    }

    public void updatePrices(int price, int store_no) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        storeMapper.updatePrices(price, store_no);
    }

    public double getDistanceOfLastIndex(String x, String y, int last_index){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getDistanceOfLastIndex(x, y, last_index);
    }

    public void updateStoreForReview(int store_no, int review_num, float star_ratio) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        storeMapper.updateStoreForReview(store_no, review_num, star_ratio);
    }

    public void updateStorePrivate(int store_no, boolean is_private){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        storeMapper.updateStorePrivate(store_no, is_private);
    }

    public boolean checkStorePrivate(int store_no){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.checkStorePrivate(store_no);
    }

    public StoreDetailResponse getStoreDetail(int store_no){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreDetail(store_no);
    }

    public void updateImages(String image_list){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        storeMapper.updateImages(image_list);
    }

    public void updateServices(String json, int store_no) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        storeMapper.updateServices(json, store_no);
    }
}
