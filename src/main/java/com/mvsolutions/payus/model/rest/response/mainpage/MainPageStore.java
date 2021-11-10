package com.mvsolutions.payus.model.rest.response.mainpage;

import lombok.Data;

@Data
public class MainPageStore {
    private int store_no;
    private int class_first;
    private String name;
    private int payback_rate;
    private String thumbnail;
    private float star_rate;
    private int review_num;
}
