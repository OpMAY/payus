package com.mvsolutions.payus.model.demo;

import lombok.Data;

@Data
public class Room {
    private int room_no;
    private int store_no;
    private String name;
    private String thumbnail;
    private String room_option;
    private String explain;
    private int price;
    private String price_option;
    private String reg_date;
}
