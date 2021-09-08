package com.boot.demo.model.response.home;

import lombok.Data;

@Data
public class HomeUser {
    private int user_no;
    private String name;
    private String profile_img;
    private int point;
}
