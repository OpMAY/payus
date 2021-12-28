package com.mvsolutions.payus.model.web.vendor.request.auth;

import lombok.Data;

@Data
public class StoreRegisterRequest {
    private int vendor_no;
    private int class_first;
    private int class_second;
    private String name;
    private int payback_rate;
    private String phone;
    private String address;
    private double address_x;
    private double address_y;
    private String address_1depth;
    private String address_2depth;
    private String address_3depth;
    private String address_short;
    private String address_road;
    private String thumbnail;
    private String image_list;
    private String reg_date;
}
