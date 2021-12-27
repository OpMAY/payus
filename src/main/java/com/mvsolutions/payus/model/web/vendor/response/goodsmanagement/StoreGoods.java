package com.mvsolutions.payus.model.web.vendor.response.goodsmanagement;

import lombok.Data;

@Data
public class StoreGoods {
    private int goods_no;
    private int store_no;
    private String name;
    private int price;
    private String reg_date;
    private String img;
    private String goods_explain;
}
