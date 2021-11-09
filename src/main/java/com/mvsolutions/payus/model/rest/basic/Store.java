package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

import java.util.List;

@Data
public class Store {
    private int store_no;
    private int vendor_no;
    private int class_first;
    private int class_second;
    private String name;
    private int payback_rate;
    private String thumbnail;
    private float star_rate;
    private String explain;
    private String phone;
    private String address;
    private double address_x;
    private double address_y;
    private String address_1depth;
    private String address_2depth;
    private String address_3depth;
    private String address_short;
    private String address_road;
    private int review_num;
    private boolean store_private;
    private String img_list;
    private String reg_date;
}
