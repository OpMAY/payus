package com.boot.demo.model.response.main;

import lombok.Data;

@Data
public class RecommendedStore {
    private int store_no;
    private String store_name;
    private String explain;
    private String short_address;
    private String thumbnail;
    private int review_num;
    private float star_ratio;
    private int price;
    private int payback_ratio;
}
