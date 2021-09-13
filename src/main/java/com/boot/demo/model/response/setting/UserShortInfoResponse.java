package com.boot.demo.model.response.setting;

import lombok.Data;

@Data
public class UserShortInfoResponse {
    private int user_no;
    private String name;
    private int point;
    private String profile_img;
}
