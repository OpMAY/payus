package com.mvsolutions.payus.model.rest.response.storedetailpage;

import lombok.Data;

import java.util.List;

@Data
public class StoreDetailPageResponse {
    private int store_no;
    private int class_first;
    private int class_second;
    private int payback_rate;
    private String name;
    private float star_rate;
    private String explain;
    private String phone;
    private String address;
    private String address_road;
    private double address_x;
    private double address_y;
    private int review_num;
    private List<String> image_list;
    private double distance;
}
