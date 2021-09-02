package com.boot.demo.model.utility.kakaolocation;

import lombok.Data;

@Data
public class Address {
    private String address_name;
    private String region_1depth_name;
    private String region_2depth_name;
    private String region_3depth_name;
    private String region_3depth_h_name;
    private String h_code;
    private String b_code;
    private String mountain_yn;
    private String main_address_no;
    private String sub_address_no;
    private String x;
    private String y;
}
