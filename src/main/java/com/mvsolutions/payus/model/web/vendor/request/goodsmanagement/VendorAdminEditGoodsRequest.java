package com.mvsolutions.payus.model.web.vendor.request.goodsmanagement;

import lombok.Data;

@Data
public class VendorAdminEditGoodsRequest {
    private int goods_no;
    private int vendor_no;
    private int store_no;
    private String original_goods_name;
    private String goods_name;
    private String goods_explain;
    private int price;
    private String goods_img;
}
