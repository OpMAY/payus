package com.mvsolutions.payus.model.rest.response.usermypage;

import lombok.Data;

@Data
public class UserFavoriteListPageResponse {
    private int favorite_no;
    private int store_no;
    private String thumbnail;
    private String name;
    private String address_short;
    private int class_first;
    private int payback_rate;
}
