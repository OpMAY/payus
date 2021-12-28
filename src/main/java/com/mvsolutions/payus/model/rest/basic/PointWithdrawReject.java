package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointWithdrawReject {
    private int reject_no;
    private int withdraw_no;
    private String reason;
    private String reg_date;
}
