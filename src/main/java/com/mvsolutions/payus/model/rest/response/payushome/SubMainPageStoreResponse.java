package com.mvsolutions.payus.model.rest.response.payushome;

import lombok.Data;

@Data
public class SubMainPageStoreResponse {
    private int store_no;
    private String name;
    private int class_first;
    private int class_second;
    private String thumbnail;
    private int payback_rate;
    private String address_short;
    private float star_rate;
    private int review_num;
}
