package com.boot.demo.mapper;

import com.boot.demo.model.Store;
import com.boot.demo.model.response.home.HomePaybackStore;
import java.util.List;

public interface StoreMapper {
    List<HomePaybackStore> getStoreRandomListForHome();

    List<HomePaybackStore> getStoreListOrderByPaybackRatioForHome();

    void insertStores(Store store);

    List<HomePaybackStore> getStoreRandomListForMain(String x, String y, int category);
}
