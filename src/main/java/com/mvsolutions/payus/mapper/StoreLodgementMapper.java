package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.StoreLodgement;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreDetailLodgementResponse;

public interface StoreLodgementMapper {
    void insertLodgement(StoreLodgement storeLodgement);

    StoreDetailLodgementResponse getLodgementData(int store_no);
}
