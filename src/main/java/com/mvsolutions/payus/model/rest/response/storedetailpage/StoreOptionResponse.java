package com.mvsolutions.payus.model.rest.response.storedetailpage;

import com.mvsolutions.payus.model.rest.basic.Goods;
import com.mvsolutions.payus.model.rest.basic.StoreInformation;
import com.mvsolutions.payus.model.rest.basic.StoreService;
import lombok.Data;

import java.util.List;

@Data
public class StoreOptionResponse {
    private int store_no;
    private List<StoreService> service_list;
    private List<StoreInformation> information;
    private List<Goods> goods_list;
}
