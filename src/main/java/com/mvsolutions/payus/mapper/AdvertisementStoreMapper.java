package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.payushome.PayusHomeEventResponse;

import java.util.List;

public interface AdvertisementStoreMapper {
    List<PayusHomeEventResponse> getEventStoreList(double x, double y, int class_first);

    int checkStoreOnEvent(int store_no);
}
