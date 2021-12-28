package com.mvsolutions.payus.model.web.vendor.request.goodsmanagement;

import lombok.Data;

@Data
public class VendorAdminRegisterGoodsRequest {
    private int vendor_no;
    private int store_no;
    private String goods_name;
    private String goods_explain;
    private int price;
    private String reg_date;
    private String goods_img;
}
