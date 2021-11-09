package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointWithdraw {
    private int withdraw_no;
    private int user_no;
    private int point;
    private int status;
    private String reg_date;
    private boolean read_check;
}
