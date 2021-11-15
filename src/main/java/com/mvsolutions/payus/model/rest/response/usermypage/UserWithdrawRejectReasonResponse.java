package com.mvsolutions.payus.model.rest.response.usermypage;

import lombok.Data;

@Data
public class UserWithdrawRejectReasonResponse {
    private int reject_no;
    private String reason;
    private String reg_date;
}
