package com.boot.demo.mapper;

import com.boot.demo.model.Store;
import com.boot.demo.model.response.detail.StoreDetailResponse;
import com.boot.demo.model.response.home.HomePaybackStore;
import com.boot.demo.model.response.main.RecommendedStore;
import com.boot.demo.model.response.main.StoreNoCheck;

import java.util.List;

public interface StoreMapper {
    List<HomePaybackStore> getStoreRandomListForHome();

    List<HomePaybackStore> getStoreListOrderByPaybackRatioForHome();

    void insertStores(Store store);

    List<HomePaybackStore> getStoreRandomListForMain(String x, String y, int category);

    StoreNoCheck checkStoreIsValid(int last_index);

    List<RecommendedStore> getStoreRecommendListForMain(String x, String y, int category);

    List<RecommendedStore> getStoreRecommendListForMainReload(String x, String y, int category, int last_index, double last_distance);

    void updatePrices(int price, int store_no);

    double getDistanceOfLastIndex(String x, String y, int last_index);

    void updateStoreForReview(int store_no, int review_num, float star_ratio);

    void updateStorePrivate(int store_no, boolean is_private);

    boolean checkStorePrivate(int store_no);

    StoreDetailResponse getStoreDetail(int store_no);

    void updateImages(String image_list);
}
