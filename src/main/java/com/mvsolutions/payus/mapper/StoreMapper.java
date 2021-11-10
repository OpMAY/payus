package com.mvsolutions.payus.mapper;


import com.mvsolutions.payus.model.rest.basic.Store;
import com.mvsolutions.payus.model.rest.response.mainpage.MainPageStore;

import java.util.List;

public interface StoreMapper {
    List<MainPageStore> getStoreListForMain(double x, double y, int class_first);

    List<MainPageStore> getStoreListForMainReload(int class_first, double distance, int last_index, double x, double y);

    double getDistanceOfLastIndex(double x, double y, int last_index);

    boolean checkStoreExists(int last_index);

    void insertStore(Store store);
}
