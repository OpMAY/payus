package com.mvsolutions.payus.model.rest.response.payushome;

import lombok.Data;

@Data
public class StoreKeywordSearchResponse {
    private int store_no;
    private String name;
    private int payback_rate;
    private String thumbnail;
    private String address_short;
    private float star_rate;
    private int review_num;
    private int class_first;
}
