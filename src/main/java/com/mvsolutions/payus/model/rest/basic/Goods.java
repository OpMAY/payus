package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class Goods {
    private int goods_no;
    private String name;
    private String goods_explain;
    private int price;
    private String img;
    private String reg_date;
}
