package com.mvsolutions.payus.model.rest.response.payushome;

import lombok.Data;

@Data
public class StoreMapSearchResponse {
    private int store_no;
    private String name;
    private int class_first;
    private String address_short;
    private String thumbnail;
    private float star_rate;
    private int review_num;
    private double address_x;
    private double address_y;
}
