package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.demo.Store;
import com.mvsolutions.payus.model.demo.response.detail.StoreDetailResponse;
import com.mvsolutions.payus.model.demo.response.home.HomePaybackStore;
import com.mvsolutions.payus.model.demo.response.main.RecommendedStore;
import com.mvsolutions.payus.model.demo.response.main.StoreNoCheck;

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

    void updateServices(String service_list, int store_no);
}
