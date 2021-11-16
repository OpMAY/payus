package com.mvsolutions.payus.model.rest.response.usermypage;

import lombok.Data;

@Data
public class UserMyPageResponse {
    private int user_no;
    private int user_code;
    private String nickname;
    private int point;
}
