package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class Room {
    private int room_no;
    private String name;
    private String room_explain;
    private int price;
    private String room_img;
    private String reg_date;
}
