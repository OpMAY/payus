package com.mvsolutions.payus.model.web.vendor.response.goodsmanagement;

import lombok.Data;

@Data
public class VendorStoreManagementGoodsPagingResponse {
    private int goods_num;
    private StoreGoods goodsList;
}
