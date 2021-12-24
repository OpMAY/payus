package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.Goods;
import com.mvsolutions.payus.model.rest.basic.StoreInformation;
import com.mvsolutions.payus.model.rest.basic.StoreService;

import java.util.List;

public interface StoreOptionMapper {
    List<StoreService> getStoreServiceList(int store_no);

    List<StoreInformation> getStoreInformationList(int store_no);

    List<Goods> getStoreGoodsList(int store_no);
}
