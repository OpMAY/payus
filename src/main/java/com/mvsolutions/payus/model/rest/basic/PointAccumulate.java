package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointAccumulate {
    private int accumulate_no;
    private int user_no;
    private int store_no;
    private String store_name;
    private int point;
    private int status;
    private int review_status;
    private String reg_date;
    private boolean read_check;
}
