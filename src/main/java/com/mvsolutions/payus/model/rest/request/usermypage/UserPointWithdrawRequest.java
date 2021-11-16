package com.mvsolutions.payus.model.rest.request.usermypage;

import lombok.Data;

@Data
public class UserPointWithdrawRequest {
    private int user_no;
    private int original_point;
    private int request_point;
    private String reg_date;
}
