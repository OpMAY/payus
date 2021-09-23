package com.boot.demo.model.demo;

import lombok.Data;

@Data
public class StoreLike {
    private int like_no;
    private int store_no;
    private int user_no;
    private int vendor_no;
    private String reg_date;
}
