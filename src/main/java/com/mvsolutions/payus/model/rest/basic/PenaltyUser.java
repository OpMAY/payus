package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PenaltyUser {
    private int penalty_no;
    private int user_no;
    private String reason;
    private String start_date;
    private String end_date;
    private int days;
    private String reg_date;
}
