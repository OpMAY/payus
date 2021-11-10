package com.mvsolutions.payus.model.rest.response.loginpage.user;

import lombok.Data;

@Data
public class UserPenaltyResponse {
    private int user_no;
    private String name;
    private String reason;
    private String start_date;
    private String end_date;
}
