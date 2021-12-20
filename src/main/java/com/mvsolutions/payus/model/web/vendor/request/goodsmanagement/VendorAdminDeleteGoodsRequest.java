package com.mvsolutions.payus.model.web.vendor.request.goodsmanagement;

import lombok.Data;

@Data
public class VendorAdminDeleteGoodsRequest {
    private int vendor_no;
    private int goods_no;
    private String goods_name;
    private int goods_type;
}
