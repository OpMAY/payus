package com.boot.demo.model.response.detail;

import lombok.Data;

import java.util.List;

@Data
public class StoreDetailResponse {
    private int store_no;
    private String store_name;
    private List<String> image_list;
    private int payback_ratio;
    private String explain;
    private float star_ratio;
    private int review_num;
    private String address;
    private List<StoreRoomComponents> room_list;
    private List<Integer> service_list;
    private String information;
    private List<StoreReviewComponents> review_list;
}
