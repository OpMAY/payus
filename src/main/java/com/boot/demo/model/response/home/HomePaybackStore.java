package com.boot.demo.model.response.home;

import lombok.Data;

@Data
public class HomePaybackStore {
    private int store_no;
    private String store_name;
    private String short_address;
    private String thumbnail;
    private int payback_ratio;
    private int review_num;
    private float star_ratio;
}
