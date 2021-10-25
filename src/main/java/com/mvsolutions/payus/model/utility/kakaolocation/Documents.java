package com.mvsolutions.payus.model.utility.kakaolocation;

import lombok.Data;

@Data
public class Documents {
    private String address_name;
    private String address_type;
    private String x;
    private String y;
    private Address address;
    private RoadAddress road_address;
}
