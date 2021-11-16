package com.mvsolutions.payus.model.rest.response.usermypage;

import lombok.Data;

@Data
public class UserPointWithdrawListResponse {
    private int withdraw_no;
    private int point;
    private int status;
    private String reg_date;
    private boolean read_check;
}
