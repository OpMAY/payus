package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class Favorite {
    private int favorite_no;
    private int store_no;
    private int user_no;
    private String reg_date;
}
