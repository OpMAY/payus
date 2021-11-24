package com.mvsolutions.payus.mapper;


import com.mvsolutions.payus.model.rest.basic.Store;
import com.mvsolutions.payus.model.rest.response.mainpage.MainPageStore;
import com.mvsolutions.payus.model.rest.response.payushome.StoreKeywordSearchResponse;
import com.mvsolutions.payus.model.rest.response.payushome.StoreMapSearchResponse;
import com.mvsolutions.payus.model.rest.response.payushome.SubMainPageStoreResponse;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreDetailPageResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.PointStoreDataResponse;

import java.util.List;

public interface StoreMapper {
    List<MainPageStore> getStoreListForMain(double x, double y, int class_first);

    List<MainPageStore> getStoreListForMainReload(int class_first, double distance, int last_index, double x, double y);

    double getDistanceOfLastIndex(double x, double y, int last_index);

    boolean checkStoreExists(int last_index);

    void insertStore(Store store);

    PointStoreDataResponse getStorePaybackData(int vendor_no);

    List<SubMainPageStoreResponse> getStoreListForSubMain(double x, double y, int class_first, int order_type, int class_second);

    List<SubMainPageStoreResponse> getStoreListForSubMainReload(double x, double y, int class_first, int order_type, int class_second);

    List<StoreKeywordSearchResponse> searchByKeywords(double x, double y, String keyword, int last_index);

    List<StoreMapSearchResponse> searchByMap(double x, double y);

    StoreDetailPageResponse getStoreDetailPage(int store_no, double x, double y);

    void updateStoreByReview(int store_no, int review_num, float star_rate);

    boolean checkPrivate(int store_no);

    String getStoreNameByAccumulateNo(int accumulate_no);
}
