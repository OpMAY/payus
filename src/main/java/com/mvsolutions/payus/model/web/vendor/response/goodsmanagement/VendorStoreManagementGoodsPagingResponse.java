package com.mvsolutions.payus.model.web.vendor.response.goodsmanagement;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementGoodsPagingResponse {
    private int goods_num;
    private List<StoreGoods> goodsList;
}
