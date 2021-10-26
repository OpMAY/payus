package com.mvsolutions.payus.model.utility.kakaolocation;

import lombok.Data;

@Data
public class RoadAddress {
    private String address_name;
    private String region_1depth_name;
    private String region_2depth_name;
    private String region_3depth_name;
    private String road_name;
    private String underground_yn;
    private String main_building_no;
    private String sub_building_no;
    private String building_name;
    private String zone_no;
    private String x;
    private String y;
}
